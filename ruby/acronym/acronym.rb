class Acronym
  def self.abbreviate(str)
    words = str.split(/[ -]/)
    words
      .map { |word| word[0] }
      .join
      .upcase
  end
end

module BookKeeping
  VERSION = 4
end

