class Say

  NUMBERS = {
    '1' => 'one', '2' => 'two', '3' => 'three', '4' => 'four', '5' => 'five',
    '6' => 'six', '7' => 'seven', '8' => 'eight', '9' => 'nine', '10' => 'ten', '11' => 'eleven',
    '12' => 'twelve', '13' => 'thirteen', '14' => 'fourteen', '15' => 'fifteen', '16' => 'sixteen',
    '17' => 'seventeen', '18' => 'eighteen', '19' => 'nineteen', '20' => 'twenty', '30' => 'thirty',
    '40' => 'forty', '50' => 'fifty', '60' => 'sixty', '70' => 'seventy', '80' => 'eighty',
    '90' => 'ninety',
  }

  SIZES = ['billion', 'million', 'thousand', '']

  def initialize(number)
    @number = number
  end

  def in_english
    raise ArgumentError.new("Number too large") if @number > 999999999999
    raise ArgumentError.new('No negatives please') if @number < 0
    return 'zero' if @number == 0

    @number
      .to_s
      .rjust(12, '0')
      .chars
      .each_slice(3)
      .map { |part| translate(part) }
      .zip(SIZES)
      .reject { |number, _| number == '' }
      .flatten
      .join(" ")
      .strip
  end

  private

  def translate(part)
    hundreds = NUMBERS[part[0]]
    tens = part[1] == '1' ? NUMBERS[part[1..-1].join] : NUMBERS[(part[1].to_i*10).to_s]
    units = part[1] == '1' ? nil : NUMBERS[part[2]]
    build(hundreds, tens, units)
  end

  def build(hundreds,tens,units)
    res = ""
    res << "#{hundreds} hundred " if hundreds
    res << "#{tens}" if tens
    res << "-" if tens && units
    res << "#{units}" if units
    res
  end
end

module BookKeeping
  VERSION = 1
end

