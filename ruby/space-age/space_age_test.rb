require 'minitest/autorun'
require_relative 'space_age'

# Common test data version: 1.0.0 7c63e40
class SpaceAgeTest < Minitest::Test
  # assert_in_delta will pass if the difference
  # between the values being compared is less
  # than the allowed delta
  DELTA = 0.01

  def test_age_on_earth
    age = SpaceAge.new(1_000_000_000)
    assert_in_delta 31.69, age.on_earth, DELTA
  end

  def test_age_on_mercury
    age = SpaceAge.new(2_134_835_688)
    assert_in_delta 280.88, age.on_mercury, DELTA
  end

  def test_age_on_venus
    age = SpaceAge.new(189_839_836)
    assert_in_delta 9.78, age.on_venus, DELTA
  end

  def test_age_on_mars
    age = SpaceAge.new(2_329_871_239)
    assert_in_delta 39.25, age.on_mars, DELTA
  end

  def test_age_on_jupiter
    age = SpaceAge.new(901_876_382)
    assert_in_delta 2.41, age.on_jupiter, DELTA
  end

  def test_age_on_saturn
    age = SpaceAge.new(3_000_000_000)
    assert_in_delta 3.23, age.on_saturn, DELTA
  end

  def test_age_on_uranus
    age = SpaceAge.new(3_210_123_456)
    assert_in_delta 1.21, age.on_uranus, DELTA
  end

  def test_age_on_neptune
    age = SpaceAge.new(8_210_123_456)
    assert_in_delta 1.58, age.on_neptune, DELTA
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
