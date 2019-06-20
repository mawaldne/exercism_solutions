class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = Hash.new 0
    clean_phrase = @phrase.gsub(/[^a-zA-Z\d\s']/,' ')
    clean_phrase.gsub!(/\s+'/,' ')
    clean_phrase.gsub!(/'\s+/,' ')

    clean_phrase.downcase.split.each { |word| words[word] += 1 }
    words
  end
end
