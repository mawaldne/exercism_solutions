pub fn encode(n: u64) -> String {
    if n == 0 {
        return String::from("zero");
    }
    translate(n)
}

pub fn translate(n: u64) -> String{

    let below_twenty = [
        "", "one", "two", "three", "four", "five", "six", "seven",
        "eight", "nine", "ten", "eleven", "twelve", "thirteen",
        "fourteen", "fifteen", "sixteen", "seventeen", "eighteen",
        "nineteen"
    ];

    let tens = [
        "", "", "twenty", "thirty", "forty", "fifty", "sixty",
        "seventy", "eighty", "ninety"
    ];


    match n {
        0 => format!(""),

        1 ... 19 => format!("{}", below_twenty[n as usize]),

        20 ... 99 => {
            if n % 10 == 0 {
                format!("{}", tens[n as usize / 10])
            } else {
                format!("{}-{}", tens[n as usize / 10], translate(n % 10))
            }
        },

        100 ... 999 => {
            if n % 100 == 0 {
                format!("{} hundred", translate(n / 100))
            } else {
                format!("{} hundred {}", translate(n / 100), translate(n % 100))
            }
        },

        1000 ... 99999 => {
            if n % 1000 == 0 {
                format!("{} thousand", translate(n / 1000))
            } else {
                format!("{} thousand {}", translate(n / 1000), translate(n % 1000))
            }
        },

        100_000 ... 999999 => {
            if n % 100_000 == 0 {
                format!("{} hundred thousand", translate(n/ 100000))
            } else {
                format!("{} hundred {}", translate(n / 100000), translate(n % 100000))
            }
        },

        1_000_000 ... 99_999_999 => {
            if n % 1_000_000 == 0 {
                format!("{} million", translate(n / 1_000_000))
            } else {
                format!("{} million {}", translate(n / 1_000_000), translate(n % 1_000_000))
            }
        }

        1_000_000_000 ... 99_999_999_999 => {
            if n % 1_000_000_000 == 0 {
                format!("{} billion", translate(n / 1_000_000_000))
            } else {
                format!("{} billion {}", translate(n / 1_000_000_000), translate(n % 1_000_000_000))
            }
        }

        _ => format!("")
    }
}
