require 'set'

class Queens
  MIN_ROW = 0
  MAX_ROW = 7
  MIN_COL = 0
  MAX_COL = 7

  def initialize(white: nil, black: nil)
    raise ArgumentError if white && !valid_position?(white)
    raise ArgumentError if black && !valid_position?(black)
    @white = white
    @black = black
  end

  def attack?
    @white.first == @black.first ||
    @white.last  == @black.last  ||
    @white.first - @black.first == @white.last - @black.last ||
    @white.first - @black.first == @black.last - @white.last
  end

  private

  def valid_position?(pos)
    !pos.nil? &&
    pos[0].between?(MIN_ROW, MAX_ROW) &&
    pos[1].between?(MIN_COL, MAX_COL)
  end
end

module BookKeeping
  VERSION = 2
end

