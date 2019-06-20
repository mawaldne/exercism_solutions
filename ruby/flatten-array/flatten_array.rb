class FlattenArray

  # recursive
  # def self.flatten(array)
  #   array.reject(&:nil?).each_with_object([]) do |element, result|
  #     if element.is_a? Array
  #       result.concat(flatten(element))
  #     else
  #       result << element
  #     end
  #   end
  # end

  # Non recursive
  def self.flatten(array)
    result = []
    array = array.dup # don't mutate original array
    while array.length != 0
      element = array.shift
      next if element.nil?

      if element.is_a? Array
        array.unshift(*element)
      else
        result << element
      end
    end
    result
  end

end

module BookKeeping
  VERSION = 1
end

