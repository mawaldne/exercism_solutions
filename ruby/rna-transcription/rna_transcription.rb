class Complement
  def self.of_dna(strand)
    new_strand = ''
    strand.each_char do |nucleotides|
      case nucleotides
        when 'G'
          new_strand += 'C'
        when 'C'
          new_strand += 'G'
        when 'T'
          new_strand += 'A'
        when 'A'
          new_strand += 'U'
        else
          new_strand = ''
          break
      end
    end
    return new_strand
  end
end
