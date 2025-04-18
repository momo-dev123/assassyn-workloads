package generator

import (
	"fmt"
	"strings"
)

func (i *Insn) genCodeVdVs2VmP2(pos int) []string {
	vdMask := strings.HasPrefix(i.Name, "vm")

	combinations := i.combinations([]LMUL{1}, []SEW{8}, []bool{false, true}, i.vxrms())
	if !vdMask {
		combinations = i.combinations(allLMULs, allSEWs, []bool{false, true}, i.vxrms())
	}

	res := make([]string, 0, len(combinations))
	for _, c := range combinations[pos:] {
		builder := strings.Builder{}
		builder.WriteString(c.initialize())

		vd, vs2, _ := getVRegs(c.LMUL1, false, i.Name)
		builder.WriteString(i.gWriteRandomData(LMUL(1) * 2))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(0, c.LMUL1, c.SEW))
		builder.WriteString(fmt.Sprintf("li t1, %d\n", 1*i.vlenb()))
		builder.WriteString(fmt.Sprintf("add a0, a0, t1\n"))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(vs2, c.LMUL1, c.SEW))

		builder.WriteString(i.gWriteRandomData(c.LMUL1))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(vd, c.LMUL1, c.SEW))

		builder.WriteString("# -------------- TEST BEGIN --------------\n")
		builder.WriteString(i.gVsetvli(c.Vl, c.SEW, c.LMUL))
		builder.WriteString(fmt.Sprintf("%s v%d, v%d%s\n",
			i.Name, vd, vs2, v0t(c.Mask)))
		builder.WriteString("# -------------- TEST END   --------------\n")

		builder.WriteString(i.gResultDataAddr())
		builder.WriteString(i.gStoreRegisterGroupIntoResultData(vd, c.LMUL1, c.SEW))
		builder.WriteString(i.gMagicInsn(vd, c.LMUL1))

		res = append(res, builder.String())
	}
	return res
}
