pub fn raindrops(i: i32) -> String {
    let mut s = String::from("");
    if i % 3 == 0 {
        s.push_str(&String::from("Pling"));
    }
    if i % 5 == 0 {
        s.push_str(&String::from("Plang"));
    }
    if i % 7 == 0 {
        s.push_str(&String::from("Plong"));
    }
    if s.is_empty() {
        return i.to_string();
    }
    s
}
