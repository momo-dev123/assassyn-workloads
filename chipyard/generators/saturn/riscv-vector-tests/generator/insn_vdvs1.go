package generator

import (
	"fmt"
	"strings"
)

func (i *Insn) genCodeVdVs1(pos int) []string {
	combinations := i.combinations(allLMULs, allSEWs, []bool{false}, i.vxrms())
	res := make([]string, 0, len(combinations))

	for _, c := range combinations[pos:] {
		builder := strings.Builder{}
		builder.WriteString(c.initialize())

		vd, vs1, _ := getVRegs(c.LMUL1, true, i.Name)
		builder.WriteString(i.gWriteRandomData(c.LMUL1))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(vd, c.LMUL1, c.SEW))

		builder.WriteString(i.gWriteTestData(false, false, false, c.LMUL1, c.SEW, 0, 1))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(vs1, c.LMUL1, c.SEW))

		builder.WriteString("# -------------- TEST BEGIN --------------\n")
		builder.WriteString(i.gVsetvli(c.Vl, c.SEW, c.LMUL1))
		builder.WriteString(fmt.Sprintf("%s v%d, v%d\n",
			i.Name, vd, vs1))
		builder.WriteString("# -------------- TEST END   --------------\n")

		builder.WriteString(i.gResultDataAddr())
		builder.WriteString(i.gStoreRegisterGroupIntoResultData(vd, c.LMUL1, c.SEW))
		builder.WriteString(i.gMagicInsn(vd, c.LMUL1))

		res = append(res, builder.String())
	}

	return res
}
