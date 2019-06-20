class Array

  def keep
    return to_enum(__method__) { size } unless block_given?
    inject([]) do |array, item|
      array << item if yield(item)
      array
    end
  end

 def discard
    return to_enum(__method__) { size } unless block_given?
    inject([]) do |array,item|
      array << item unless yield(item)
      array
    end
  end
end
