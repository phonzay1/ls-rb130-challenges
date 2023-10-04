# rubocop:disable Layout/LineLength
=begin
Problem/Requirements:
- create `Scrabble` class

  - constructor method:
    - takes one argument: a word(string)

  - `score` instance method:
    - empty strings score 0
    - whitespace characters score 0
    - `nil` scores 0
    - scoring is case insensitive

  - `score` class method:
    - takes one argument: a word(string)
    - returns the score for its argument word (we assume following the same rules
    as the instance method?)
--------------------
Data Structure:
- constructor method takes a string, the word to be scored
- `score` method returns an integer
- use a hash to match letters with their corresponding point values
-------------------
Algorithm:
- constructor method:
  - save the argument word

- `score` instance method:
  - return 0 unless valid_word?
  - initialize local variable `word_score` to 0
  - iterate through each character of the word, upcased
    - for each character, iterate through the `LETTER_SCORES` hash:
      - if the current key includes that character, add the value of that key to
      `word_score`
  - return `word_score`

- `score` class method:
  - takes one argument: a word(string)
  - instantiate a new `Scrabble` object with the argument word passed into the constructor
  - call `Scrabble#score` on the new object

- helper method `valid_word?`
  - return false if the word is an empty string, includes whitespace, or is nil
  - otherwise return true
=end
# rubocop:enable Layout/LineLength

require 'pry'

LETTER_SCORES = {
  %w(A E I O U L N R S T) =>	1,
  %w(D G) =>	2,
  %w(B C M P) => 3,
  %w(F H V W Y)	=> 4,
  %w(K)	=> 5,
  %w(J X) =>	8,
  %w(Q Z) =>	10
}

class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    return 0 unless valid_word?

    word_score = 0
    word.upcase.each_char do |char|
      LETTER_SCORES.each do |letters, points|
        word_score += points if letters.include?(char)
      end
    end
    word_score
  end

  def self.score(scrabble_word)
    Scrabble.new(scrabble_word).score
  end

  private

  attr_reader :word

  def valid_word?
    !(word == '' || word.nil? || word.match?(/\s/))
  end
end

# word = Scrabble.new('cabbage')
# puts word.score
