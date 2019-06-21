package grains

import "fmt"

func SquareTotal(n int) (uint64, uint64, error) {
	if n < 0 {
		return 0, 0, fmt.Errorf("Cant use negative")
	}

	if n == 0 {
		return 0, 0, fmt.Errorf("Cant use zero")
	}

	var sum uint64 = 1
	var square uint64 = 1

	for i := 0; i < n-1; i++ {
		square <<= 1
		sum += square
	}
	return sum, square, nil
}

func Square(n int) (uint64, error) {

	if n > 64 {
		return 0, fmt.Errorf("Cant use > 64")
	}

	_, square, err := SquareTotal(n)
	return square, err
}

func Total() uint64 {
	sum, _, _ := SquareTotal(64)
	return sum
}
