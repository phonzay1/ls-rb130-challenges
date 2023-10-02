=begin
Problem/Requirements:
- `Anagram` class

  - constructor method
     - takes one argument (a string), the word to be tested for anagrams

  - `#match`
    - takes one arg, an array of strings
    - returns an array containing the strings from the arg that are anagrams of
    the test word
      - anagrams contain the exact same letters, each with the exact same # of occurrences
      - anagrams are case-insensitive
      - words with the exact same letters in the exact same sequence are NOT anagrams
      (ex. 'corn' and 'CoRn' are not anagrams)
--------------------
Data Structure:
- test words are strings
- `#match` takes an array of strings
- may be useful to use arrays to organize and iterate over the chars in each word,
to compare them
--------------------
Algorithm:
- constructor method:
  - accept and save the arg word, downcased
  - save the test word as an array of its chars, downcased and sorted

- `#match`:
  - accept an array (of strings), `words`
  - map the arg array to a nested array, where each element is a sub-array of the
  chars in each word, downcased and sorted
  - instantiate an empty array, `anagrams`
  - iterate over the mapped array with index:
    - if the current subarray == the test word chars array, add the element at the
    current index in `words` to `anagrams`, unless that element downcased == the
    test word downcased
  - return `anagrams`
=end

class Anagram
  def initialize(word)
    @word = word.downcase
    @characters = @word.chars.sort
  end

  def match(words)
    comparison_chars = words.map { |other_word| other_word.downcase.chars.sort }
    anagrams = []
    comparison_chars.each_with_index do |subarr, idx|
      if subarr == characters && words[idx].downcase != word
        anagrams << words[idx]
      end
    end
    anagrams
  end

  private

  attr_reader :word, :characters
end