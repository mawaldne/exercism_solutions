pub fn nth(n: u32) -> Option<u32> {
    if n <= 0 {
        return None;
    }
    // Stolen from andrew4fr. So awesome
    (2u32..).filter(|&x| is_prime(x)).nth((n - 1) as usize)
}

pub fn is_prime(n: u32) -> bool {
    if n < 2 {
        return false;
    } else if n == 2 || n == 3 {
        return true;
    } else if n > 3 && n % 2 == 0 {
        return false;
    }

    //http://stackoverflow.com/questions/5811151/why-do-we-check-upto-the-square-root-of-a-prime-number-to-determine-if-it-is-pri
    let max = (n as f64).sqrt() as u32 + 1;
    let mut i: u32 = 3;
    let step = 2;

    while i <= max {
        if n % i == 0 {
            return false;
        }
        i += step;
    }
    true
}
