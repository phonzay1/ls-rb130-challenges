# rubocop:disable Layout/LineLength
=begin
Problem & Requirements:
- create a class RomanNumeral

  - constructor method:
    - takes one argument, the decimal number to be converted

  - `to_roman` method:
    - converts the decimal number to its Roman numeral equivalent and returns that
    as a string
--------------
Data Structure:
- the decimal number is an Integer
- the Roman numeral returned by `to_roman` is a string
- it may be useful to convert the decimal number to an array of its digits which
can be iterated over - this also helps us with keeping track of the ones, tens, hundreds
place, etc
- it may be useful to push Roman numeral characters into an array, which can then
be joined into a single string
--------------
Algorithm:
- constructor method:
  - save the decimal number

- `to_roman`:
  - convert the decimal number to an array of its digits, in order from least to
  most significant digit
  - initialize an empty string `numerals`
  - iterate over the digits and prepend the return value for each digit to `numerals`:
    - for digits[0] use helper method `ones`:
      - if the digit <= 3, return 'I' * the digit
      - if the digit == 4, return 'IV'
      - if the digit == 5, return 'V'
      - if the digit > 5 and < 9, return 'V' + 'I' * (digit % 5)
      - if the digit == 9, return 'IX'
    - for digits[1] use helper method `tens`:
      - if the digit <= 3, return 'X' * the digit
      - if the digit == 4, return 'XL'
      - if the digit == 5, return 'L'
      - if the digit > 5 and < 9, return 'L' + 'X' * (digit % 5)
      - if the digit == 9, return 'XC'
    - for digits[2] use helper method `hundreds`:
      - if the digit <= 3, return 'C' * the digit
      - if the digit == 4, return 'CD'
      - if the digit == 5, return 'D'
      - if the digit > 5 and < 9, return 'D' + 'C' * (digit % 5)
      - if the digit == 9, return 'CM'
    - for digits[3] use helper method `thousands`:
      - if the digit <= 3, return 'M' * the digit
  - return `numerals`
=end
# rubocop:enable Layout/LineLength

# Roman numerals for reference
# ROMAN_NUMERALS = {
#   1 => 'I',
#   5 => 'V',
#   10 => 'X',
#   50 => 'L',
#   100 => 'C',
#   500 => 'D',
#   1000 => 'M'
# }

class RomanNumeral
  def initialize(number)
    @number = number
    @digits = number.digits
  end

  def to_roman
    numerals = ''
    digits.each_with_index do |digit, index|
      case index
      when 0 then numerals.prepend(ones)
      when 1 then numerals.prepend(tens)
      when 2 then numerals.prepend(hundreds)
      when 3 then numerals.prepend('M' * digit)
      end
    end
    numerals
  end

  private

  attr_reader :number, :digits

  def ones
    case digits[0]
    when (0..3) then 'I' * digits[0]
    when 4 then 'IV'
    when 5 then 'V'
    when (5..8) then "V#{'I' * (digits[0] % 5)}"
    when 9 then 'IX'
    end
  end

  def tens
    case digits[1]
    when (0..3) then 'X' * digits[1]
    when 4 then 'XL'
    when 5 then 'L'
    when (5..8) then "L#{'X' * (digits[1] % 5)}"
    when 9 then 'XC'
    end
  end

  def hundreds
    case digits[2]
    when (0..3) then 'C' * digits[2]
    when 4 then 'CD'
    when 5 then 'D'
    when (5..8) then "D#{'C' * (digits[2] % 5)}"
    when 9 then 'CM'
    end
  end
end
