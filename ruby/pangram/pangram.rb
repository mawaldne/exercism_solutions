require 'set'

class Pangram
  def self.pangram?(phrase)
    return false if phrase.length == 0
    chars = ('a'..'z').to_set - phrase.downcase.chars.to_set
    chars.empty?
  end
end
