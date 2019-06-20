pub fn build_proverb(list: Vec<&str>) -> String {
    if list.len() == 0 {
        return String::from("")
    }

    let mut proverb = Vec::new();
    for i in 0..list.len()-1 {
        proverb.push(verse(list[i], list[i+1]));
    }
    proverb.push(end(list[0]));
    return proverb.join("\n");
}

pub fn verse(a: &str, b: &str) -> String {
    format!("For want of a {} the {} was lost.", a, b)
}

pub fn end(a: &str) -> String {
    format!("And all for the want of a {}.", a)
}

/* Adams. Nice...
pub fn build_proverb(list: Vec<&str>) -> String {
    if list.is_empty() {
        return String::new()
    }
    let mut iter = list
        .iter()
        .zip(list.iter().skip(1))
        .map(|(a, b)| format!("For want of a {} the {} was lost.", a, b))
        .collect::<Vec<String>>();

    iter.extend(vec![format!("And all for the want of a {}.", &list[0])]);
    iter.join("\n")
}
*/
