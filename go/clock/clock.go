package clock

import (
	"fmt"
)

const testVersion = 4

type Clock struct {
    hours, minutes int
}

func New(hour, minute int) Clock {
    minutes := minute % 60
    if minutes < 0 {
        minutes = minutes + 60
    }

    additional_hours := minute / 60
    hours := (hour + additional_hours) % 24
    if hours < 0 {
        hours = hours + 24
    }

    return Clock {
     hours : hours,
     minutes : minutes,
    }
}

func (c Clock) String() string {
    return fmt.Sprintf("%02d:%02d", c.hours, c.minutes)
}

func (c Clock) Add(minutes int) Clock {
    c.minutes += minutes
    return c
}
