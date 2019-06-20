class BeerSong

  def verse(beer)
    return beer_text("#{beer} bottles", "#{beer - 1} bottles") if beer > 2
    return beer_text("#{beer} bottles", "1 bottle") if beer == 2
    return one_beer_text("1 bottle", "No more bottles") if beer == 1
    last_beer_text("No more bottles", "99 bottles")
  end

  def verses(ending, start)
    (start..ending).reverse_each.map { |beer| verse(beer) }.join("\n")
  end

  private

  def beer_text(bottles, next_bottles)
"#{bottles} of beer on the wall, #{bottles.downcase} of beer.\nTake one down and pass it around, #{next_bottles.downcase} of beer on the wall.\n"
  end

  def one_beer_text(bottles, next_bottles)
"#{bottles} of beer on the wall, #{bottles.downcase} of beer.\nTake it down and pass it around, #{next_bottles.downcase} of beer on the wall.\n"
  end

  def last_beer_text(bottles, next_bottles)
"#{bottles} of beer on the wall, #{bottles.downcase} of beer.\nGo to the store and buy some more, #{next_bottles.downcase} of beer on the wall.\n"
  end
end
