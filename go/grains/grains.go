package grains

import "fmt"

func Square(n int) (uint64, error) {
	if n < 1 || n > 64 {
		return 0, fmt.Errorf("Must be between 1 and 64")
	}

	return 1 << uint(n-1), nil
}

func Total() uint64 {
	return 1<<uint(64) - 1
}
