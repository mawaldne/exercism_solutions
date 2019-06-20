use std::collections::HashMap;

pub fn check(candidate: &str) -> bool {
    let mut stats: HashMap<char, u64> = HashMap::new();
    for ch in candidate.to_lowercase().chars() {
        if ch == '-' || ch == ' ' {
            continue;
        }
        *stats.entry(ch).or_insert(0) += 1;
    }
    stats.iter().all(|(_, &count)| count == 1)
}

/* adam used a hash set. NICE ONE!
 *
 * pub fn check(candidate: &str) -> bool {
    let chars = String::from(candidate)
        .chars()
        .filter(|&x| x != '-' && x != ' ')
        .map(|x| x.to_ascii_lowercase())
        .collect::<Vec<_>>();

    let len = chars.len();

    let set: HashSet<_> = HashSet::from_iter(chars);

    set.len() == len
}
*/
