class Squares
  def initialize(val)
    @val = val
  end

  def sum_of_squares
    (1..@val).map { |v| v**2 }.reduce(:+)
  end

  def square_of_sum
    (1..@val).reduce(:+)**2
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
