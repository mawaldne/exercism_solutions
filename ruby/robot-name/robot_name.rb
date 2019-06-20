class Robot
  attr_reader :name

  def initialize
    @name = random_name
  end

  def random_name
    name = create_name
    name = create_name while @@created_names.key?(name)
    @@created_names[name] += 1
    name
  end

  def create_name
    # SUPER SLOW...
    chars = (0...2).map { (65 + rand(26)).chr }.join
    number = rand(9).to_s + rand(9).to_s + rand(9).to_s
    chars + number
  end

  def self.forget
    @@created_names = Hash.new(0)
  end

  def reset
    @name = random_name
  end
end
