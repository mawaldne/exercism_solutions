package robotname

import (
	"math/rand"
)

type Robot struct {
	name string
}

func New() *Robot {
	return new(Robot)
}

func (r *Robot) Name() (string, error) {
	if r.name == "" {
		r.name = generate()
	}
	return r.name, nil
}

func (r *Robot) Reset() {
	r.name = generate()
}

func generate() string {
	bytes := make([]byte, 5)

	for i := 0; i < 2; i++ {
		bytes[i] = byte(rand.Intn(26) + 65)
	}

	for i := 2; i < 5; i++ {
		bytes[i] = byte(rand.Intn(10) + 48)
	}
	return string(bytes)
}
