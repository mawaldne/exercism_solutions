class Clock
  def self.at(h, m)
    Clock.new(h, m)
  end

  def to_s
    calculate
  end

  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def calculate
    additional_hours, minutes = @minutes.divmod(60)
    hours = (@hours + additional_hours) % 24
    return "%02d:%02d" % [hours, minutes]
  end

  def +(minutes)
    @minutes += minutes
    self
  end

  def ==(other)
    calculate == other.to_s
  end
end

module BookKeeping
  VERSION = 2
end

