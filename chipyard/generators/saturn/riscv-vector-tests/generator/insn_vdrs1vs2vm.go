package generator

import (
	"fmt"
	"math"
	"strings"
)

func (i *Insn) genCodeVdRs1Vs2Vm(pos int) []string {
	vdWidening := strings.HasPrefix(i.Name, "vw")
	vdSize := iff(vdWidening, 2, 1)

	sews := iff(vdWidening, allSEWs[:len(allSEWs)-1], allSEWs)
	combinations := i.combinations(
		iff(vdWidening, wideningMULs, allLMULs),
		sews,
		[]bool{false, true},
		i.vxrms(),
	)
	res := make([]string, 0, len(combinations))

	for _, c := range combinations[pos:] {
		builder := strings.Builder{}
		builder.WriteString(c.initialize())

		builder.WriteString(i.gWriteRandomData(LMUL(1)))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(0, LMUL(1), SEW(32)))

		vdEMUL1 := LMUL(math.Max(float64(int(c.LMUL)*vdSize), 1))
		vdEEW := c.SEW * SEW(vdSize)
		if vdEEW > SEW(i.Option.XLEN) {
			res = append(res, "")
			continue
		}

		vd, vs2, _ := getVRegs(vdEMUL1, false, i.Name)
		builder.WriteString(i.gWriteIntegerTestData(vdEMUL1, vdEEW, 0))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(vd, vdEMUL1, vdEEW))

		builder.WriteString(i.gWriteIntegerTestData(c.LMUL1, c.SEW, 2))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(vs2, c.LMUL1, c.SEW))

		cases := i.integerTestCases(c.SEW)
		for a := 0; a < len(cases); a++ {
			builder.WriteString("# -------------- TEST BEGIN --------------\n")
			switch c.SEW {
			case 8:
				builder.WriteString(fmt.Sprintf("li s0, %d\n", convNum[uint8](cases[a][0])))
			case 16:
				builder.WriteString(fmt.Sprintf("li s0, %d\n", convNum[uint16](cases[a][0])))
			case 32:
				builder.WriteString(fmt.Sprintf("li s0, %d\n", convNum[uint32](cases[a][0])))
			case 64:
				builder.WriteString(fmt.Sprintf("li s0, %d\n", convNum[uint64](cases[a][0])))
			}
			builder.WriteString(i.gVsetvli(c.Vl, c.SEW, c.LMUL))
			builder.WriteString(fmt.Sprintf("%s v%d, s0, v%d%s\n",
				i.Name, vd, vs2, v0t(c.Mask)))
			builder.WriteString("# -------------- TEST END   --------------\n")

			builder.WriteString(i.gResultDataAddr())
			builder.WriteString(i.gStoreRegisterGroupIntoResultData(vd, vdEMUL1, vdEEW))
			builder.WriteString(i.gMagicInsn(vd, vdEMUL1))
		}

		res = append(res, builder.String())
	}

	return res
}
