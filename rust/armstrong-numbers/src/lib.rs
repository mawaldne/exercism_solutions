pub fn is_armstrong_number(num: u32) -> bool {
    let sum: u32 = num
      .to_string()
      .chars()
      .map(|c| c.to_digit(10).unwrap())
      .map(|n| n.pow((num.to_string().len()) as u32))
      sum();

    sum == num
}
