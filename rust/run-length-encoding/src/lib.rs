extern crate itertools;
use itertools::Itertools;

extern crate regex;
use regex::Regex;

pub fn encode(source: &str) -> String {
    source
        .chars()
        .group_by(|elt| *elt)
        .into_iter()
        .map(|(c, group)|
            if group.count() > 1 {
                format!("{}{}",group.count(), c)
            } else {
                format!("{}", c)
            })
        .collect::<String>()
}

pub fn decode(source: &str) -> String {
    let re = Regex::new(r"(\d*)([ \w]+?)").unwrap();
    let mut decoded = vec![];

    for caps in re.captures_iter(source) {
        let c = caps.get(2).unwrap().as_str();
        let times_str = caps.get(1).unwrap().as_str();
        if times_str.len() > 0 {
            decoded.push(c.repeat(times_str.parse().unwrap()));
        } else {
            decoded.push(c.to_string());
        }
    }
    decoded.join("")
}

