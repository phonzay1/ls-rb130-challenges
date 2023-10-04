# rubocop:disable Layout/LineLength
=begin
Problem/Requirements:
- class `BeerSong`

  - class method `verse`
    - takes one argument, an integer
    - returns a string: the lyrics corresponding to the nth verse (the verse number
    represented by the argument - the beer bottles start at that number and then
    decrement by 1)
    - if the argument is 2, then
      - the second line of the verse should refer to '1 bottle' singular, not
      'bottles' plural
    - if the argument is 1, then
      - the first line should refer to "bottle" singular, not "bottles" plural
      - the second line of the verse should read "...no more bottles..." rather
      than "...0 more bottles..."
    - if the argument is 0, then
      - see the test case for expected lyrics

  - class method `verses`
    - takes 2 arguments, both integers
    - return all verses from the first to the second argument, inclusive (in
      descending order)
    - each verse should be separated by a newline character

  - class method `lyrics`
    - takes no arguments
    - returns all verses from 99 to 0 in descending order, with each verse separated
    by a newline char
----------------------
Data Structure:
- `BeerSong::verse`
  -accepts one integer as argument
  - returns a string

- `BeerSong::verses`
  -it may be useful to use a range or array so you can iterate over each number in the range
  (descending) and return the appropriate verse
  - maybe use an array to store verses until you're ready to join them with a newline char
  - returns a string

- `BeerSong::lyrics` returns a string
----------------------
Algorithm:
- `verse` class method
  - should accept one argument (integer between 0-99)
  - initialize an empty string for the verse
  - use the helper method to return the first line of the corresponding verse for
  that number, and add it to the string
  - passing in the argument-1, use the helper method to return the second line
  of the corresponding verse for that number, and add it to the string
  - return the string

- `verses` class method
  - accepts two arguments (both integers between 0-99, where the first argument
  is greater than the second)
  - initialize an empty array
  - iterate through the numbers from the first argument down to the second argument
  (inclusive):
    - for each number, use the `verse` method to return the appropriate verse and
    add it to the empty array
  - join the elements of the array together with a newline character(s), and return
  the resulting string

- `lyrics` class method
  - use the `verses` class method, passing in 99 and 0 as arguments

- helper method to return first verse line
  - takes one argument, an integer
  - if the argument is between 2-99 (inclusive), return the string "#{parameter}
  bottles of beer on the wall, #{parameter} bottles of beer.\n"
  - if the argument is 1, return the string "1 bottle of beer on the wall, 1 bottle of beer.\n"
  - if the argument is 0, return the string "No more bottles of beer on the wall,
  no more bottles of beer.\n"

- helper method to return second verse line
  - takes one argument, an integer
  - if the argument is between 2-99 (inclusive), return the string "Take one down
  and pass it around, #{parameter} bottles of beer on the wall.\n"
  - if the argument is 1, return the string "Take one down and pass it around, 1
  bottle of beer on the wall.\n"
  - if the argument is 0, return the string "Take it down and pass it around, no
  more bottles of beer on the wall.\n"
  - if the argument is -1, return the string "Go to the store and buy some more,
  99 bottles of beer on the wall.\n"
=end
# rubocop:enable Layout/LineLength

class BeerSong
  def self.verse(number)
    verse_first_line(number) + verse_second_line(number - 1)
  end

  def self.verses(start_num, end_num)
    lyrics = []
    start_num.downto(end_num) do |verse_num|
      lyrics.push(verse(verse_num))
    end
    lyrics.join("\n")
  end

  def self.lyrics
    verses(99, 0)
  end

  class << self
    private

    def verse_first_line(number)
      case number
      when 2..99
        "#{number} bottles of beer on the wall, #{number} bottles of beer.\n"
      when 1
        "1 bottle of beer on the wall, 1 bottle of beer.\n"
      when 0
        "No more bottles of beer on the wall, no more bottles of beer.\n"
      end
    end

    def verse_second_line(number)
      case number
      when 2..99
        "Take one down and pass it around, #{number} bottles of beer on the wall.\n"
      when 1
        "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      when 0
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
      when -1
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
    end
  end
end
