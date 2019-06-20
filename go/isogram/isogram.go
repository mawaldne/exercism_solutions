package isogram

import "unicode"

func IsIsogram(s string) bool {
	m := make(map[rune]bool)
	for _, r := range s {
		if unicode.IsLetter(r) {
			lc := unicode.ToLower(r)
			if _, ok := m[lc]; ok {
				return false
			}
			m[lc] = true
		}
	}

	return true

}
