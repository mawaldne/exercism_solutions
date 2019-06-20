package twofer

import "fmt"

func ShareWith(s string) string {
	if s != "" {
		return fmt.Sprintf("One for %s, one for me.", s)
	}
	return "One for you, one for me."
}
