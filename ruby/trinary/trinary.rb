class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    return 0 if @trinary.gsub(/[012]/,'') != ''

    @trinary.
      reverse.
      chars.
      each_with_index.
      map { |b, index| b.to_i * 3**index }.
      reduce(:+)
  end
end
