class RailFenceCipher
  VERSION = 1

  def initialize(str, rails)
    @str = str
    @rails = rails
  end

  def self.encode(str, rails)
    new(str, rails).encode
  end

  def self.decode(str, rails)
    new(str, rails).decode
  end

  def decode
    zigzag.
      sort.
      zip(@str.chars).
      sort_by { |a| a[0][1] }.
      map { |a| a[1] }.
      join
  end

  def encode
    zigzag.
      zip(@str.chars).
      sort.
      map { |a| a[1] }.
      join
  end

  private

  def zigzag
    pattern = (0..@rails - 1).to_a + (@rails - 2).downto(1).to_a
    pattern.cycle.first(@str.length).zip(0..@str.length)
  end
end
