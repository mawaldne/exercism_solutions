class Bst
  include Enumerable
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @right = nil
    @left = nil
  end

  def insert(data)
    if data > @data
      right_insert(data)
    else
      left_insert(data)
    end
  end

  def left_insert(data)
    if @left.nil?
      @left = Bst.new(data)
    else
      @left.insert(data)
    end
  end

  def right_insert(data)
    if @right.nil?
      @right = Bst.new(data)
    else
      @right.insert(data)
    end
  end

  def each(&block)
    return to_enum(__method__) unless block_given?
    return if @data.nil?
    @left&.each(&block)
    yield data
    @right&.each(&block)
  end
end

module BookKeeping
  VERSION = 1
end

