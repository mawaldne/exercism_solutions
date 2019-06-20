class SumOfMultiples

  def initialize(*d)
    @divisors = *d.sort
  end

  def to(limit)
    return 0 if @divisors.length == 0
    return 0 if limit < @divisors[0]

    (@divisors[0]..limit - 1)
      .select { |m| multiple?(m) }
      .reduce(:+)
  end

  private

  def multiple?(m)
    @divisors.any? { |div| m % div == 0 }
  end
end
