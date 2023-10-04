# rubocop:disable Layout/LineLength
=begin
Problem/Requirements:
- `Octal` class

  - constructor method
    - accepts one argument, an octal number (input as a String object)

  - `to_decimal` instance method
    - takes no arguments
    - returns the octal number in decimal form, as an Integer object
    - invalid input (strings containing 8, 9, letters) should be treated as octal
    0 and return 0
    - octal numbers (represented as strings) are allowed to start with 0
--------------------
Data Structure:
- the argument for new `Octal` objects is a String object - the octal numbers are
represented as strings
- `to_decimal` returns an Integer object
- *maybe* use an array to organize/operate on each octal digit one at a time?
--------------------
Algorithm:
- constructor method
  - accept and save one argument, an octal number represented by a String

- `to_decimal`
  - if the octal number contains any characters other than the digits 0-7, return 0
  - otherwise, convert the octal number to an Integer object and separate the number
  into an array of its digits in reverse order (from least to most significant)
    - (this will work even if the octal number has leading 0's - they'll just
    get dropped when it's converted to an Integer object)
  - transform (map) the digits array with its indexes:
    - multiply each element by (8 raised to the power of the element's index)
  - sum the elements of the transformed array, and return that sum
=end
# rubocop:enable Layout/LineLength

class Octal
  def initialize(octal_num)
    @octal_num = octal_num
  end

  def to_decimal
    return 0 if octal_num.match?(/[^0-7]/)
    octal_num.to_i.digits.map.with_index { |digit, index| digit * (8**index) }.sum
  end

  private

  attr_reader :octal_num
end
