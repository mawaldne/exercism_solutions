pub fn square_of_sum(n: usize) -> usize {
    ((1..=n).fold(0, |acc, x| acc + x)).pow(2)
}

pub fn sum_of_squares(n: usize) -> usize {
    (1..=n).map(|x| x.pow(2)).fold(0, |acc, x| acc + x)
}

pub fn difference(n: usize) -> usize {
    square_of_sum(n) - sum_of_squares(n)
}
