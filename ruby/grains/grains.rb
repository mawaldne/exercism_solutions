class Grains
  def self.square(n)
    raise ArgumentError if n <= 0 || n > 64
    2**(n-1)
  end

  # https://math.stackexchange.com/questions/22599/how-to-prove-a-formula-for-the-sum-of-powers-of-2-by-induction
  def self.total
    2**64 - 1
  end
end
