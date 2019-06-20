class Nucleotide
  attr_reader :histogram

  NUCLEOTIDE = ['A', 'C', 'G', 'T']

  def initialize(dna)
    raise ArgumentError unless dna.scan(/[^ACGT]/).empty?
    @dna = dna
    create_histogram
  end

  def self.from_dna(dna)
    new(dna)
  end

  def count(nucleotide)
    @histogram[nucleotide]
  end

  private

  def create_histogram
    @histogram = {}
    NUCLEOTIDE.each { |n| @histogram[n] = 0 }

    @dna.chars { |n| @histogram[n] += 1 }
  end
end
