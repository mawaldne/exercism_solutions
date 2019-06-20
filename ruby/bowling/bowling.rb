class Game
  class BowlingError < StandardError; end

  def initialize
    @current_frame = 0
  end

  def roll(pins)
    validate_roll(pins)
    record(pins)
  end

  def record(pins)
    current = @current_frame

    # Check back at least 2 frames. We might have 3 strikes in a row
    previous = @current_frame - 2
    previous = 0 if previous < 0

    frames[previous..current].each { |frame| frame << pins }
    @current_frame += 1 if frames[current].complete?
  end

  def score
    validate_score
    frames[0..9].map(&:score).reduce(:+)
  end

  private

  def validate_roll(pins)
    raise BowlingError.new("Pins are 0 - 10") if pins < 0 || pins > 10
    raise BowlingError.new("Game Complete") if frames[9].complete?
  end

  def validate_score
    raise BowlingError.new("Game Incomplete") unless frames[9].complete?
  end

  def frames
    @frames ||= (0..9).each_with_object([]) do |index, array|
      index < 9 ? array << Frame.new : array << TenthFrame.new
    end
  end

  class Frame
    def <<(pin)
      scores << pin if scorable?
      validate
    end

    def complete?
      scores.length == 2 || score == 10
    end

    def score
      scores.reduce(:+)
    end

    private

    def scores
      @scores ||= []
    end

    def validate
      if !strike? && scores.length > 1 && (scores[0] + scores[1]) > 10
        raise BowlingError.new('Pins more than 10 points')
      end
    end

    def scorable?
      scores.length < 2 ||
      (scores.length < 3 && (strike? || spare?))
    end

    def strike?
      scores[0] == 10
    end

    def spare?
      scores.length > 1 && (scores[0] + scores[1] == 10)
    end
  end

  class TenthFrame < Frame
    def complete?
      (scores.length == 2 && !strike? && !spare?) ||
      (scores.length == 3 && spare?) ||
      (scores.length == 3 && strike?)
    end

    private

    def validate
      super
      if strike? && !bonus_strike? && scores.length > 2 && (scores[1] + scores[2]) > 10
        raise BowlingError.new('Bonus Pins more than 10 points')
      end
    end

    def bonus_strike?
      scores[1] == 10
    end
  end
end

module BookKeeping
  VERSION = 3
end
