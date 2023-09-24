=begin
Problem/Requirements:
- `SumOfMultiples` class

  - constructor method
    - takes a variable number of arguments: a set of one or more numbers (assuming from the test cases
    and problem description that they will be natural numbers less than the comparison
    number - the test cases don't list any errors to be raised)

  - class method `to`
    - takes one argument, a natural number
    - returns an integer: the sum of all integers that are 1) less than the argument,
    and 2) can be evenly divided by 3 and/or 5

  - instance method `to`
    - takes one argument, a natural number
    - returns an integer: the sum of all integers that are 1) less than the argument,
    and 2) can be evenly divided by any of the set of numbers passed to the constructor
    method

  **For both `to` methods: if a number is a multiple of more than one number in the
  set, that number still gets added to the sum of multiples *only once* (ex. given
  20 and a set of 3 & 5: 15 is a multiple of both 3 and 5 - only add 15 to the sum
  of multiples once)
------------------------
Data Structure:
- for the constructor: the variable number of arguments (which should all be Integer
objects) will be passed in in an array
- for each `to` method - the argument should be an Integer object
- *may* want to use an array to contain the multiples and use built-in methods like
`sum`, checking if the array already `include?`s a number (or `uniq` could be helpful),
etc
------------------------
Algorithm:
- constructor method:
  - should accept and save a variable number of arguments, all of which are Integer
  objects

- `to` class method:
  - takes one argument, a natural number
  - call `sum_of_multiples`, passing in the argument and the set of numbers [3, 5]

- `to` instance method:
  - takes one argument, a natural number
  - call `sum_of_multiples`, passing in the argument and the instance's set of numbers

- helper method `sum_of_multiples`
  - takes two arguments: 1) the max number(limit) and 2) a set of numbers (variable
  amount of numbers in the set)
  - initialize an empty array, `multiples`
  - iterate from the lowest number in the set of numbers up to (the limit-1)
    - test if the current number is evenly divisible by *any* of the numbers in
    the set of numbers
      - if it is, add it to `multiples`
  - return the sum of the elements of `multiples`
=end

# Solution using module method
# class SumOfMultiples
#   def initialize(*numbers)
#     @set_of_numbers = (numbers.size > 0) ? numbers : [3, 5]
#   end

#   def self.to(limit)
#     Calculable.sum_of_multiples(limit, [3, 5])
#   end

#   def to(limit)
#     Calculable.sum_of_multiples(limit, set_of_numbers)
#   end

#   private

#   attr_reader :set_of_numbers
# end

# module Calculable
#   def self.sum_of_multiples(limit, array_of_numbers)
#     multiples = []
#     (array_of_numbers.min).upto(limit - 1) do |candidate_num|
#       if array_of_numbers.any? { |factor| candidate_num % factor == 0 }
#         multiples << candidate_num
#       end
#     end
#     multiples.sum
#   end
# end

#-----------------------

# Solution using instance method inside class method, and different method implementations

class SumOfMultiples
  def initialize(*numbers)
    @set_of_numbers = (numbers.size > 0) ? numbers : [3, 5]
  end

  def self.to(limit)
    SumOfMultiples.new().to(limit)
  end

  def to(limit)
    multiples(limit).sum
  end

  private

  attr_reader :set_of_numbers

  def multiples(limit)
    results = []
    (set_of_numbers.min).upto(limit - 1) do |candidate_num|
      if set_of_numbers.any? { |factor| candidate_num % factor == 0 }
        results << candidate_num
      end
    end
    results
  end
end

