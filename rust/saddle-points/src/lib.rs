pub fn find_saddle_points(input: &[Vec<u64>]) -> Vec<(usize, usize)> {
    let mut saddle_points: Vec<(usize, usize)> = Vec::new();
    if input[0].len() == 0 {
        return saddle_points
    }

    for row_index in 0..input.len() {
        for col_index in 0..input[row_index].len() {
            let value = input[row_index][col_index];
            let row = &input[row_index];

            if row.iter().any(|&x| value < x) {
                continue;
            }

            let column = input.iter().map(|r| r[col_index]).collect::<Vec<u64>>();
            if column.iter().any(|&x| value > x) {
                continue;
            }
            saddle_points.push((row_index, col_index));
        }
    }
    saddle_points
}

