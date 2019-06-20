pub fn reply(remark: &str) -> &'static str {
    let remark = remark.trim();

    if remark.is_empty() {
        return "Fine. Be that way!";
    }


    let yell = remark.to_uppercase() == remark &&
               remark.chars().any(char::is_uppercase);

    let question = remark.chars().last() == Some('?');

    if yell && question {
        return "Calm down, I know what I'm doing!";
    }

    if question {
       return "Sure.";
    }

    if yell {
        return "Whoa, chill out!";
    }

    return "Whatever."
}

