package raindrops

import "strconv"

func Convert(n int) string {
	raindrops := ""
	if n%3 == 0 {
		raindrops += "Pling"
	}
	if n%5 == 0 {
		raindrops += "Plang"
	}
	if n%7 == 0 {
		raindrops += "Plong"
	}

	if raindrops == "" {
		return strconv.Itoa(n)
	}
	return raindrops

}
