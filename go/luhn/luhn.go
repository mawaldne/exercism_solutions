package luhn

import (
	"strconv"
	"strings"
)

// cribbed from:
// https://github.com/golang/example/blob/master/stringutil/reverse.go
func Reverse(s string) string {
	r := []rune(s)
	for i, j := 0, len(r)-1; i < len(r)/2; i, j = i+1, j-1 {
		r[i], r[j] = r[j], r[i]
	}
	return string(r)
}

func Valid(s string) bool {
	number := strings.ReplaceAll(s, " ", "")
	if len(number) < 2 {
		return false
	}
	number = Reverse(number)

	total := 0
	for i, n := range number {
		if num, err := strconv.Atoi(string(n)); err == nil {
			if i%2 == 0 {
				total += num
			} else {
				val := num * 2
				if val > 9 {
					total += val - 9
				} else {
					total += val
				}
			}
		} else {
			return false
		}
	}
	return total%10 == 0
}
