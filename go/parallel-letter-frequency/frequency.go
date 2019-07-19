package letter

// FreqMap records the frequency of each rune in a given text.
type FreqMap map[rune]int

// Frequency counts the frequency of each rune in a given text and returns this
// data as a FreqMap.
func Frequency(s string) FreqMap {
	m := FreqMap{}
	for _, r := range s {
		m[r]++
	}
	return m
}

func ConcurrentFrequency(inputs []string) FreqMap {
	m := FreqMap{}
	freqs := make(chan FreqMap)

	for _, input := range inputs {
		go func(input string) {
			freqs <- Frequency(input)
		}(input)
	}

	for i := 0; i < len(inputs); i++ {
		freq := <-freqs
		for k, v := range freq {
			m[k] += v
		}
	}

	return m
}
