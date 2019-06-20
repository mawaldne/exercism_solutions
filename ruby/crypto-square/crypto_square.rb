class Crypto
  attr_reader :normalize_plaintext
  def initialize(text)
    @text = text
  end

  def normalize_plaintext
    @normalize_plaintext ||= @text.downcase.gsub(/[^[:alnum:]]/, '')
  end

  def size
    (normalize_plaintext.length ** 0.5).ceil
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).map(&:join)
  end

  def ciphertext
    ciphertext_segments.flatten.join
  end

  def normalize_ciphertext
    ciphertext_segments.map { |s| s.join }.join(' ')
  end

  private

  def ciphertext_segments
    ct = Array.new(size) { [] }
    plaintext_segments.each do |segment|
      segment.chars.each_with_index do |char, index|
        ct[index] << char
      end
    end
    ct
  end

end
