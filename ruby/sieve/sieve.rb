class Sieve
  def initialize(val)
    @val = val
  end

  def primes
    return [] if @val <= 1
    array = (2..@val).to_a
    array.each { |p| array.reject! { |num| num % p == 0 && num != p }}
  end
end
