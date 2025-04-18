package generator

import (
	"fmt"
	"log"
	"regexp"
	"strconv"
	"strings"
)

func (i *Insn) genCodeVdVs2(pos int) []string {
	s := regexp.MustCompile(`vmv(\d)r.v`)
	nr, err := strconv.Atoi(s.FindStringSubmatch(i.Name)[1])
	if err != nil {
		log.Fatal("unreachable")
	}

	combinations := i.combinations([]LMUL{LMUL(nr)}, allSEWs, []bool{false}, i.vxrms())
	res := make([]string, 0, len(combinations))

	for _, c := range combinations[pos:] {
		builder := strings.Builder{}
		builder.WriteString(c.initialize())

		vd, vs2, _ := getVRegs(c.LMUL, true, i.Name)
		builder.WriteString(i.gWriteRandomData(c.LMUL * 2))

		builder.WriteString(i.gLoadDataIntoRegisterGroup(vd, c.LMUL, c.SEW))
		builder.WriteString(fmt.Sprintf("li t1, %d\n", int(c.LMUL)*i.vlenb()))
		builder.WriteString(fmt.Sprintf("add a0, a0, t1\n"))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(vs2, c.LMUL, c.SEW))

		builder.WriteString("# -------------- TEST BEGIN --------------\n")
		builder.WriteString(i.gVsetvli(c.Vl, c.SEW, c.LMUL))
		builder.WriteString(fmt.Sprintf("%s v%d, v%d\n",
			i.Name, vd, vs2))
		builder.WriteString("# -------------- TEST END   --------------\n")

		builder.WriteString(i.gResultDataAddr())
		builder.WriteString(i.gStoreRegisterGroupIntoResultData(vd, c.LMUL, c.SEW))
		builder.WriteString(i.gMagicInsn(vd, c.LMUL))

		res = append(res, builder.String())

	}

	return res
}
