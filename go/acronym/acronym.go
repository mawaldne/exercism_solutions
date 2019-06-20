package acronym

import (
	"strings"
)

func Abbreviate(s string) string {
	words := strings.FieldsFunc(s, Split)
	acronym := ""
	for _, word := range words {
		acronym += strings.ToUpper(string(word[0]))
	}
	return acronym
}

func Split(r rune) bool {
	return r == ' ' || r == '-'
}
