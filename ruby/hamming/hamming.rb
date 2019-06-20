module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

class Hamming
  def self.compute(a, b)
    raise ArgumentError if a.length != b.length

    count = 0
    (0..a.length).each do |i|
      count += 1 if a[i] != b[i]
    end
    return count
  end
end

