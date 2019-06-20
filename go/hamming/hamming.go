package hamming

import "errors"

func Distance(a, b string) (int, error) {
	if len(a) != len(b) {
		return -1, errors.New("Not same length")
	}
	distance := 0
	for index, _ := range a {
		if a[index] != b[index] {
			distance += 1
		}
	}
	return distance, nil
}
