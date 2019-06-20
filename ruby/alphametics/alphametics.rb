class Alphametics
  def initialize(input)
    @input = input
    @words = input.scan(/[A-Z]+/)

    # Do a dance to figure out first characters.
    # First characters can never be 0, so we can
    # reject guesses where a first char is zero
    @firsts_chars = @words.select {|w| w.size > 1 }.map {|w| w[0] }

    chars = @words.join.each_char.to_a.uniq
    @characters = @firsts_chars + (chars - @firsts_chars)
  end

  def self.solve(input)
    Alphametics.new(input).solve
  end

  def solve
    (0..9).to_a.permutation(@characters.length).each do |num|
      next if reject?(num)
      solution = @characters.zip(num).to_h
      return solution if valid?(solution)
    end
    {}
  end

  private

  def reject?(num)
    num[0, @firsts_chars.length].member? 0
  end

  def valid?(solution)
    # You can pass in hashmaps to gsub. Very cool...
    expr = @input.gsub(/[A-Z]/, solution)
    eval expr
  end
end

module BookKeeping
  VERSION = 4
end

