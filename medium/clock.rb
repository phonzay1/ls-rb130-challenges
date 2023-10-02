=begin
Problem/Requirements:
- `Clock` class

  - constructor method
    - takes two arguments: integers representing the hour (0-23) and minutes (0-60)

  - class method `at`
    - takes two arguments: integers representing the hour (0-23) and an optional
    second argument for minutes (0-60) that defaults to 0
    - calls the constructor with these args to instantiate a new `Clock` object

  - instance method `to_s`
    - returns the time represented by the `Clock` object as a string in 'hr:mn'
    format
    - midnight is "00:00"

  - instance method `+`
    - accepts one argument, an integer
    - creates a *new* `Clock` object that represents the time resulting from adding
    the argument # of minutes to the time represented by the calling `Clock` object
    (does not mutate the calling `Clock` object)
    - should be able to handle # of minutes arguments greater than 60 or 1440 by
    wrapping around appropriately

  - instance method `-`
    - accepts one argument, an integer
    - creates a *new* `Clock` object that represents the time resulting from subtracting
    the argument # of minutes from the time represented by the calling `Clock` object
    (does not mutate the calling `Clock` object)
    - should be able to handle # of minutes arguments greater than 60 or 1440 by
    wrapping around appropriately

  - instance method `==`
    - Two `Clock` objects representing the same time are considered equivalent
--------------------
Data Structure:
- hours and minutes are passed in as integers
- `to_s` returns the time represented as a string
- *maybe* use an array to hold the hour & min integers?
--------------------
Algorithm:
- constructor method
    - accept and save two arguments: hour integer (0-23) minutes integer (0-60)

- class method `at`
    - takes two arguments: hour integer (0-23) and an optional
    second argument for minutes (0-60) that defaults to 0
    - calls the constructor with these args to instantiate a new `Clock` object

  - instance method `to_s`
    - use `sprintf` to return the time represented by the `Clock` object as a string
    in 'hr:mn' format, with leading zeroes for single digits

  - instance method `==`
    - accept one arg, another `Clock` obj
    - use `Integer#==` to consider two `Clock`s equivalent if their hour AND minute
    values are both the same

  - instance method `+`
    - accepts one argument, an integer (representing minutes)
    - reassign the minutes parameter to the remainder of dividing the argument by 1440
    - now calculate the quotient & remainder of dividing the minutes by 60
      - Add the quotient to `@hours` unless the resulting sum is >23. If so, calculate
      (quotient + `@hours` - 24). Save the result either way.
      - add the remainder to `@minutes` and save that sum.
    - create a *new* `Clock` object, passing in the appropriate two sums

  - instance method `-`
    - accepts one argument, an integer (representing minutes)
    - reassign the minutes parameter to the remainder of dividing the argument by 1440
    - now calculate the quotient & remainder of dividing the minutes by 60
      - Subtract the quotient from `@hours` unless the result is <0. If so, calculate
      (`@hours` - quotient + 24). Save the result either way.
      - subtract the remainder from `@minutes` unless the result is <0. If so, calculate
      (`@minutes` - remainder + 60). Save the result either way.
    - create a *new* `Clock` object, passing in the appropriate two results
=end

class Clock
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end

  def self.at(hours, minutes=0)
    new(hours, minutes)
  end

  def to_s
    sprintf('%.2d:%.2d', hours, minutes)
  end

  def ==(other_clock)
    hours == other_clock.hours && minutes == other_clock.minutes
  end

  def +(number)
    hrs, min = calculate_hrs_min_to_process(number)
    hrs = hrs + hours > 23 ? (hrs + hours - 24) : hrs + hours
    min += minutes
    Clock.new(hrs, min)
  end

  def -(number)
    hrs, min = calculate_hrs_min_to_process(number)
    if hours == 0 && hrs == 0 && min != 0
      hrs = 23
    elsif hours - hrs < 0
      hrs = hours - hrs + 24
    elsif hours > 0 && hrs != 0
      hrs = hours - (hrs + 1)
    else
      hrs = hours - hrs
    end

    min = minutes - min < 0 ? (minutes - min + 60) : minutes - min
    Clock.new(hrs, min)
  end

  protected

  attr_accessor :hours, :minutes

  def calculate_hrs_min_to_process(number)
    number %= 1440
    number.divmod(60)
  end
end

p Clock.at(8).to_s
p Clock.at(0, 37).to_s
p Clock.at(2, 5).to_s