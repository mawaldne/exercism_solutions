class FoodChain

  ANIMAL_SWALLOWED = {
    fly: "",
    spider: "It wriggled and jiggled and tickled inside her.\n",
    bird: "How absurd to swallow a bird!\n",
    cat: "Imagine that, to swallow a cat!\n",
    dog: "What a hog, to swallow a dog!\n",
    goat: "Just opened her throat and swallowed a goat!\n",
    cow: "I don't know how she swallowed a cow!\n",
   }

  def song
    verse = ""
    animals = ANIMAL_SWALLOWED.keys

    animals.each_with_index do |animal, index|
      verse += create_verse(animal, animals[0..index].reverse.each_cons(2).to_a)
    end

    verse += i_know("horse")
    verse += dead
  end

  def self.song
    FoodChain.new.song
  end

  def create_verse(animal, swallowed_pairs)
    verse = ""
    verse += i_know(animal.to_s)
    verse += ANIMAL_SWALLOWED[animal]

    swallowed_pairs.each do |first, second|
      verse += she_swallowed(first.to_s, second.to_s)
    end

    verse += i_dont_know_why
    verse
  end

  def i_know(s)
    "I know an old lady who swallowed a #{s}.\n"
  end

  def she_swallowed(s, c)
    sentence = "She swallowed the #{s} to catch the #{c}"
    if c == 'spider'
      sentence += " that wriggled and jiggled and tickled inside her."
    else
      sentence += "."
    end
    sentence += "\n"
  end

  def i_dont_know_why
    "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
  end

  def dead
    "She's dead, of course!\n"
  end
end

module BookKeeping
  VERSION = 2
end
