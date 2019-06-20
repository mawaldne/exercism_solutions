class Palindromes
  attr_reader :largest, :smallest

  def initialize(min_factor: 1, max_factor: 1)
    @min_factor = min_factor
    @max_factor = max_factor
  end

  def generate
    hash = (@min_factor..@max_factor)
      .to_a
      .repeated_combination(2)
      .group_by { |c| c[0] * c[1] }

    palindromes =
      hash
      .keys
      .select { |key| palindrome?(key) }
      .sort

    @largest = Values.new(palindromes.last, hash[palindromes.last])
    @smallest = Values.new(palindromes.first, hash[palindromes.first])
    true
  end

  private

  def palindrome?(a)
    a.to_s == a.to_s.reverse
  end

  Values = Struct.new(:value, :factors)
end
