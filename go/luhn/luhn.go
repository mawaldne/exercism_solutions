package luhn

import (
	"strconv"
	"strings"
)

func Reverse(s string) string {
	// cribbed from:
	// https://github.com/golang/example/blob/master/stringutil/reverse.go
	r := []rune(s)
	for i, j := 0, len(r)-1; i < len(r)/2; i, j = i+1, j-1 {
		r[i], r[j] = r[j], r[i]
	}
	return string(r)
}

func Sum(numberStr string) (sum int) {
	for i, n := range numberStr {
		num, _ := strconv.Atoi(string(n))

		if i%2 == 0 {
			sum += num
		} else {
			double := num * 2
			sum += double/10 + double%10
		}
	}
	return
}

func Valid(s string) bool {
	numberStr := strings.ReplaceAll(Reverse(s), " ", "")
	_, err := strconv.Atoi(numberStr)

	if len(numberStr) < 2 || err != nil {
		return false
	}
	sum := Sum(numberStr)

	return sum%10 == 0
}
