class Brackets
  def self.paired?(s)
    stack = []
    brackets = { '{' => '}', '[' => ']', '(' => ')' }

    s.each_char do |char|
      if brackets.key?(char)
        stack.push(char)
      elsif brackets.values.include?(char)
        return false if brackets.key(char) != stack.pop
      end
    end
    stack.empty?
  end
end

module BookKeeping
  VERSION = 4
end

