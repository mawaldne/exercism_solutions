class Fixnum
  def to_roman

    numerals = {
      1000=>"M",
      900=>"CM",
      500=>"D",
      400=>"CD",
      100=>"C",
      90=>"XC",
      50=>"L",
      40=>"XL",
      10=>"X",
      9=>"IX",
      5=>"V",
      4=>"IV",
      1=>"I"
    }

    val = self
    roman_numeral = ''
    numerals.each do |decimal, numeral|
      roman_numeral << (numeral * (val / decimal))
      val = val % decimal
    end
    roman_numeral
  end
end
