pub fn is_valid_isbn(isbn: &str) -> bool {
    let chars = isbn.replace("-", "").chars();
    let last = chars.last().unwrap();

    if !last.is_digit(10) && last != 'X' {
        return false
    }
    if chars.collect::<String>().len() > 10 {
        return false
    }
    if !chars.take(9).all(|c| c.is_digit(10)) {
        return false
    }

    let total = chars
        .map(|c| match c {
           '0' ... '9' =>  c.to_digit(10).unwrap(),
            _ => 10
         })
         .enumerate()
         .collect::<Vec<(_,_)>>();
         // .map(|(i, d)| (10 - i) * d)
         // .sum();

    println!("{:?} mikey", total);
    return false
}
