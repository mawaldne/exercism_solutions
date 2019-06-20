pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    if factors.len() == 0 {
        return 0;
    }
    if limit < factors[0] {
        return 0;
    }

    (factors[0]..limit)
        .filter(|x| factors.iter().any(|div| x % div == 0))
        .sum()
}
