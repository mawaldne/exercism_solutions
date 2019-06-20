pub fn verse(n: i32) -> String {
    if n > 2 {
        return beer_text(format!("{} bottles", n), format!("{} bottles", n - 1));
    }
    if n == 2 {
        return beer_text(format!("{} bottles", n), "1 bottle".to_string());
    }
    if n == 1 {
        return one_beer_text("1 bottle".to_string(), "no more bottles".to_string());
    }
    last_beer_text("No more bottles".to_string(), "99 bottles".to_string())
}

pub fn beer_text(bottles: String, next_bottles: String) -> String {
    format!("{} of beer on the wall, {} of beer.\nTake one down and pass it around, {} of beer on the wall.\n",
    bottles, bottles, next_bottles)
}

pub fn one_beer_text(bottles: String, next_bottles: String) -> String {
    format!("{} of beer on the wall, {} of beer.\nTake it down and pass it around, {} of beer on the wall.\n",
    bottles, bottles.to_lowercase(), next_bottles)
}

pub fn last_beer_text(bottles: String, next_bottles: String) -> String {
    format!("{} of beer on the wall, {} of beer.\nGo to the store and buy some more, {} of beer on the wall.\n",
    bottles, bottles.to_lowercase(), next_bottles)
}

pub fn sing(start: i32, end: i32) -> String {
    let v: Vec<String> = (end..start+1).rev().map(|x| verse(x)).collect();
    return v.join("\n");
}
