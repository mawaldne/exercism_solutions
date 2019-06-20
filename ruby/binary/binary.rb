class Binary
  def self.to_decimal(val)
    raise ArgumentError if val.gsub(/[01]/,'') != ''

    # val |>
    # :)
    val.
      reverse.
      chars.
      each_with_index.
      map { |b, index| b.to_i * 2**index }.
      reduce(:+)
  end
end
