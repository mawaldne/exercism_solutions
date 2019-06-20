package bob

import (
	"strings"
	"unicode"
)

func Hey(remark string) string {
	remark = strings.TrimSpace(remark)
	if remark == "" {
		return "Fine. Be that way!"
	}

	question := remark[len(remark)-1:] == "?"
	hasLetters := strings.IndexFunc(remark, unicode.IsLetter) >= 0
	yell := strings.ToUpper(remark) == remark && hasLetters

	if yell && question {
		return "Calm down, I know what I'm doing!"
	}

	if question {
		return "Sure."
	}

	if yell {
		return "Whoa, chill out!"
	}

	return "Whatever."
}
