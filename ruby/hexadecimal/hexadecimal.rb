class Hexadecimal

  HEX_CHARS = { 'a': 10, 'b': 11, 'c': 12, 'd': 13, 'e': 14, 'f': 15 }

  def initialize(hex)
    @hex = hex
  end

  def to_decimal
    return 0 if @hex =~ /[g-z]/

    @hex.reverse.chars.each_with_index.map do |ch, i|
      if ch =~ /[0-9]/
        ch.to_i * 16**i
      elsif ch =~ /[a-f]/
        HEX_CHARS[ch.to_sym] * 16**i
      end
    end.reduce(:+)
  end
end
