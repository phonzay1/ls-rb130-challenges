=begin
Problem/Requirements:
- `Series` class

  - constructor method
    - accepts one argument, a string of digits

  -`slices` instance method
    - accepts one argument, an integer representing the length of consecutive
    number sequences to search for
    - returns an array in which each element is a subarray containing n(the argument)
    number of consecutive digits (as integers) from the string of digits. This array
    should contain all such possible subarrays derived from the string of digits.
    - raises an ArgumentError if the argument is too large for the number of digits
    in the string of digits
----------------------
Data Structure:
- constructor method: accepts a string of digits (0-9)
  - it may be useful to split the string into an array of its digits in order to
  iterate over them

- `slices` instance method:
  - accepts an integer
  - returns a 2D nested array, where the elements of each subarray are single-digit
  integers
----------------------
Algorithm:
-constructor method:
  - accepts a string of digits as an argument, and saves them as an array of the
  digits in Integer object form

- `slices` instance method:
  - accepts an integer as an argument (length)
  - raise an ArgumentError if length > the size of the array of digits
  - initialize an empty array `results`
  - iterate from 0 up to (size of the digits array - length) - these are the starting
  indexes
    - for each starting index, add a slice of the `digits` array from the starting
    index to the starting index + (length - 1) to the `results` array
  - return `results`
=end

class SeriesLengthError < ArgumentError; end

class Series
  def initialize(str)
    @digits = str.chars.map(&:to_i)
  end

  def slices(length)
    raise SeriesLengthError.new if length > digits.size

    results = []
    0.upto(digits.size - length) do |start_idx|
      results << digits[start_idx..(start_idx + (length - 1))]
    end
    results
  end

  private

  attr_reader :digits
end