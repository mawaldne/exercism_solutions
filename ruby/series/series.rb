class Series
  def initialize(digits)
    @digits = digits
  end

  def slices(size)
    raise ArgumentError if size > @digits.length

    (0..@digits.length - size)
      .map { |index| @digits[index..(index + size - 1)] }
  end
end
