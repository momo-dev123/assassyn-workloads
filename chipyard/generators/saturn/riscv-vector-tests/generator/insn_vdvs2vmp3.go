package generator

import (
	"fmt"
	"log"
	"math"
	"math/bits"
	"regexp"
	"strconv"
	"strings"
)

func (i *Insn) genCodeVdVs2VmP3(pos int) []string {
	s := regexp.MustCompile(`v[z|s]ext\.vf(\d)`)
	f, err := strconv.Atoi(s.FindStringSubmatch(i.Name)[1])
	if err != nil {
		log.Fatal("unreachable")
	}
	n := bits.TrailingZeros8(uint8(f))
	sews := allSEWs[len(allSEWs)-(4-n):]
	lmuls := allLMULs[:len(allLMULs)-n]

	combinations := i.combinations(lmuls, sews, []bool{false, true}, i.vxrms())
	res := make([]string, 0, len(combinations))
	for _, c := range combinations[pos:] {
		builder := strings.Builder{}
		builder.WriteString(c.initialize())

		builder.WriteString(i.gWriteRandomData(LMUL(1)))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(0, c.LMUL1, c.SEW))

		vs2EEW := c.SEW / SEW(f)

		vs2EMUL := c.LMUL / LMUL(f)
		vs2EMUL1 := LMUL(math.Max(float64(vs2EMUL), 1))

		vd, vs2, _ := getVRegs(c.LMUL1, false, i.Name)

		builder.WriteString(i.gWriteRandomData(c.LMUL1))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(vd, c.LMUL1, c.SEW))

		builder.WriteString(i.gWriteIntegerTestData(vs2EMUL1, vs2EEW, 0))
		builder.WriteString(i.gLoadDataIntoRegisterGroup(vs2, vs2EMUL1, vs2EEW))

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
