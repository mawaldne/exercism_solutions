class Prime
  def self.nth(n)
    raise ArgumentError if n <= 0
    primes = []
    prime = 2
    while primes.length < n
      primes << prime if is_prime(prime)
      prime += 1
    end
    primes[-1]
  end

  def self.is_prime(n)
    return false if n < 2
    return false if n > 2 && n % 2 == 0
    return true if n == 2 || n == 3

    # http://stackoverflow.com/questions/5811151/why-do-we-check-upto-the-square-root-of-a-prime-number-to-determine-if-it-is-pri
    max = Math.sqrt(n).round + 1

    # check only odds. Evens are covered
    (3..max).step(2) { |x| return false if n % x == 0 }
    true
  end
end
