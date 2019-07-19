package clock

import (
	"fmt"
)

const testVersion = 4

type Clock int16

func New(hour, minute int) Clock {
	return Time(hour, minute)
}

func Time(hour, minute int) Clock {
	minutes := (minute + hour*60) % 1440
	if minutes < 0 {
		minutes = minutes + 1440
	}

	return Clock(minutes)
}

func (c Clock) String() string {
	return fmt.Sprintf("%02d:%02d", c/60, c%60)
}

// Add returns a Clock with the provided minutes added.
func (c Clock) Add(minutes int) Clock {
	return Time(0, int(c)+minutes)
}

func (c Clock) Subtract(minutes int) Clock {
	return Time(0, int(c)-minutes)
}
