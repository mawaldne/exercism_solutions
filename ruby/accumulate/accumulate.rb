class Array
  def accumulate
    return to_enum(__method__) { size } unless block_given?

    result = []
    each do |item|
      result << yield(item)
    end
    result
  end
end
