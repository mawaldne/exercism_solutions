class Anagram
  def initialize(word)
    @word = word.downcase
    @sorted_characters = word.downcase.chars.sort
  end

  def match(list)
    list.select do |word|
      word.downcase != @word &&
      word.downcase.chars.sort == @sorted_characters
    end
  end
end
