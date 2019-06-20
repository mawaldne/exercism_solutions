class PhoneNumber
  def self.clean(number)
    number.gsub!(/[a-z\@\:\!\. \-\(\)\+]/, '')
    number.gsub!(/^1/, '')
    number if valid_number(number)
  end

  def self.valid_number(number)
    number.length == 10 && number =~ /^[2-9]/ && number[3] =~ /^[2-9]/
  end
end
