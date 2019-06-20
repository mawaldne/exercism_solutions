class Bob
  def self.hey(remark)
    remark.strip!
    return 'Fine. Be that way!' if remark.empty?
    return 'Whoa, chill out!' if remark.match(/[[:alpha:]]/) && remark.upcase == remark
    return 'Sure.' if remark.chars.last == '?'
    'Whatever.'
  end
end
