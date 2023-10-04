# rubocop:disable Layout/LineLength
=begin
Problem/Requirements:
- `Diamond` class

  - class method `make_diamond`
    - takes one argument, an uppercase letter from A-Z
    - given the argument, prints a hollow diamond starting with the letter 'A',
    moving through the alphabet in ascending order for the top half, and having
    the argument letter at the diamond's widest point. Then for the bottom half
    of the diamond, it moves back through the alphabet in descending order to 'A',
    so the bottom of the diamond ends in a single 'A'

    - for the top half of the diamond:
      - # of left blank spaces for the top line is 0 for argument 'A',
      then increases by 1 by letter - i.e. 2 for argument 'B', 3 for 'C', etc
      - # of left blank spaces for each successive line decrements by 1
      - # of spaces between each letter starts at 1 for 'B', then steps up by odd
      numbers for each successive letter (i.e. 3 for 'C', 5 for 'D', etc)

    - for the bottom half of the diamond:
      - # of left blank spaces starts at 0 for the middle line, then steps up by
      1 for each successive line until it matches the number of left blank spaces
      for the top line
      - # of spaces between each letter steps down through the odd numbers until
      it gets to 1 for 'B'
---------------------
Data Structures:
- `Diamond::make_diamond` accepts a string as argument, and returns the diamond
as a string
- maybe use a hash to organize constant values like number of starting/ending
outside spaces and number of inside spaces for each letter in the diamond
---------------------
Algorithm:
- `make_diamond` method
  - accepts one argument, an uppercase letter
  - if the letter is 'A', call the top/bottom lines helper method once and return
  its return value
  - otherwise:
    - initialize an empty string
    - call the top/bottom lines helper method and add its return value to the string
    - call the inner diamond helper method and add its return value to the string
    - call the top/bottom lines helper method and add its return value to the string

- top & bottom lines helper method:
  - add ' ' * FIRST_LAST_LINES_OUTSIDE_SPACES[letter] + 'A' +
  ' ' * FIRST_LAST_LINES_OUTSIDE_SPACES[letter] + ""\n"

- inner diamond helper method:
  - initialize local variable `outside_spaces` to (FIRST_LAST_LINES_OUTSIDE_SPACES[letter] - 1)
  - initialize local variable `final_letter_ord` to the argument letter's ord #
  - initialize an empty string
  - iterate from 66 (ord number for 'B') to the argument letter's ord #:
    - add to the empty string: inner_diamond_lines += ' ' * outside_spaces + "#{ord_num.chr}" + \
      ' ' * INSIDE_SPACES[ord_num.chr] + "#{ord_num.chr}" + ' ' * outside_spaces + "\n"
    - decrement `outside spaces` by 1
  - increment `outside spaces` by 1
  - iterate from (the argument letter's ord # - 1) down to 66
    - increment `outside spaces` by 1
    - add to the empty string: inner_diamond_lines += ' ' * outside_spaces + "#{ord_num.chr}" + \
      ' ' * INSIDE_SPACES[ord_num.chr] + "#{ord_num.chr}" + ' ' * outside_spaces + "\n"
  -return the string
=end
# rubocop:enable Layout/LineLength

require 'pry'

class Diamond
  FIRST_LAST_LINES_OUTSIDE_SPACES = ('A'..'Z').to_a.zip((0..25).to_a).to_h
  INSIDE_SPACES = ('B'..'Z').to_a.zip((1..49).select(&:odd?).to_a).to_h

  def self.make_diamond(letter)
    if letter == 'A'
      outermost_lines(letter)
    else
      diamond = ''
      diamond += outermost_lines(letter)
      diamond += inner_diamond(letter)
      diamond += outermost_lines(letter)
      diamond
    end
  end

  class << self
    private

    def outermost_lines(letter)
      ' ' * FIRST_LAST_LINES_OUTSIDE_SPACES[letter] + 'A' + \
      ' ' * FIRST_LAST_LINES_OUTSIDE_SPACES[letter] + "\n"
    end

    def inner_diamond(letter)
      outside_spaces = FIRST_LAST_LINES_OUTSIDE_SPACES[letter] - 1
      final_letter_ord = letter.ord
      inner_diamond_lines = ''

      66.upto(final_letter_ord) do |ord_num|
        inner_diamond_lines += ' ' * outside_spaces + "#{ord_num.chr}" + \
        ' ' * INSIDE_SPACES[ord_num.chr] + "#{ord_num.chr}" + ' ' * outside_spaces + "\n"

        outside_spaces -= 1
      end

      outside_spaces += 1

      (final_letter_ord - 1).downto(66) do |ord_num|
        outside_spaces += 1

        inner_diamond_lines += ' ' * outside_spaces + "#{ord_num.chr}" + \
        ' ' * INSIDE_SPACES[ord_num.chr] + "#{ord_num.chr}" + ' ' * outside_spaces + "\n"
      end

      inner_diamond_lines
    end
  end
end

puts Diamond.make_diamond('D')
