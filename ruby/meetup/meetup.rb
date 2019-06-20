require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year

  end

  def day(day_of_week, schedule)
    start_date = Date.new(@year, @month, 1)
    end_date = start_date.next_month.prev_day

    candidates = (start_date..end_date).select { |date| date.send("#{day_of_week}?") }

    case schedule
    when :first
      candidates[0]
    when :second
      candidates[1]
    when :third
      candidates[2]
    when :fourth
      candidates[3]
    when :last
      candidates.last
    when :teenth
      candidates.find { |date| date.mday.between?(13, 19) }
    end
  end
end

module BookKeeping
  VERSION = 1
end

