=begin
Problem/Requirements:
- `PerfectNumber` class

  - class method `classify`
    - takes one argument, the number to be classified
    - passing in a number that's *not* a natural number should raise a `StandardError`
    - For the following, positive divisors include the number 1 but not the number
    itself:
      - passing in a number where the sum of its positive divisors is less than
      the number should return the string 'deficient'
      - passing in a number where the sum of its positive divisors is equal to
      the number should return the string 'perfect'
      - passing in a number where the sum of its positive divisors is greater than
      the number should return the string 'abundant'
----------------------
Data Structure(s):
- numbers to be classified are Integers
- divisors are Integers
- return value of `PerfectNumber::classify` is a string
- could maybe use an array to collect/organize/operate on the divisors?
----------------------
Algorithm:
- `PerfectNumber::classify`
  - takes one argument, an Integer
  - raise a `StandardError` if the argument is negative (or zero, based on the
  definition of natural numbers in the problem)
  - use the `sum_of_divisors` helper method to find the sum of all of the positive
  divisors (including 1, excluding the number itself) of the argument
  - return the appropriate string based on the whether the sum of the divisors is
  less than, equal to, or greater than the argument

- `sum_of_divisors` helper method
  - takes one argument, a positive Integer
  - initialize an empty array `divisors`
  - iterate through a range of integers from 1 to the argument/2
    - for each integer, add it to `divisors` if argument % current integer == 0
  - sum the elements of the `divisors` array and return this sum
=end

class PerfectNumber
  def self.classify(integer)
    raise StandardError.new, 'number must be positive' if integer <= 0
    aliquot_sum = sum_of_divisors(integer)

    case aliquot_sum <=> integer
    when -1 then 'deficient'
    when 0 then 'perfect'
    when 1 then 'abundant'
    end
  end

  class << self
    private

    def sum_of_divisors(number)
      (1..(number/2)).each_with_object([]) do |current_num, divisors|
        divisors.push(current_num) if number % current_num == 0
      end.sum
    end
  end
end