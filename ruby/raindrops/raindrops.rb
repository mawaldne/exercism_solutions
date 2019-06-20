class Raindrops
  def self.convert(drop)
    output = ''
    output += 'Pling' if drop % 3 == 0
    output += 'Plang' if drop % 5 == 0
    output += 'Plong' if drop % 7 == 0

    return drop.to_s if output.length == 0
    output
  end
end
