pub fn series(digits: &str, len: usize) -> Vec<String> {
    if digits.len() < len {
        vec![]
    } else if len == 0 {
        vec!["".to_string(); digits.len() + 1]
    } else {
        digits.chars()
              .collect::<Vec<char>>()
              .windows(len)
              .map(|a| a.iter().collect::<String>())
              .collect::<Vec<String>>()
    }
}
