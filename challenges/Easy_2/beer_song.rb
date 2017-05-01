class BeerSong
  VERSE0 = "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  VERSE1 = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
  VERSE2 = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  SONG = [VERSE0, VERSE1, VERSE2]
  3.upto(99) do |num|
    SONG << "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"\
  end
  
  def verse(num)
    SONG[num]
  end
  
  def verses(first, last)
    first.downto(last).map { |int| SONG[int] }.join("\n")
  end
  
  def lyrics
    verses(99, 0)
  end
end