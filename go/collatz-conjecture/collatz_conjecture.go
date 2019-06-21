package collatzconjecture

import "fmt"

func CollatzConjecture(n int) (int, error) {

	if n == 0 {
		return 0, fmt.Errorf("Cant use 0")
	}
	if n < 0 {
		return 0, fmt.Errorf("Cant be negative")
	}

	steps := 0
	for n != 1 {
		if n%2 == 0 {
			n = n / 2
		} else {
			n = 3*n + 1
		}
		steps += 1
	}
	return steps, nil
}
