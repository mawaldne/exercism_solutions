pub fn factors(n: u64) -> Vec<u64> {
    let mut n = n;
    let mut factor = 2;
    let mut prime_factors: Vec<u64> = vec![];

    while n > 1 {
        if n % factor == 0 {
            prime_factors.push(factor);
            n /= factor;
        } else {
            factor += 1;
        }
    }
    prime_factors
}

