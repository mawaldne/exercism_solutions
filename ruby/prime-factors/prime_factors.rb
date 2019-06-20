require 'prime'

class PrimeFactors
  def self.for(n)
    return [n] if Prime.prime? n

    prime_factors = []
    curr = n
    while curr != 1
      Prime.each(n) do |p|
        if curr % p == 0
          curr = curr / p
          prime_factors << p
          break;
        end
      end
    end
    prime_factors
  end
end
