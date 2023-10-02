=begin
Problem/Requirements:
- `Robot` class

  - constructor method
    - takes no arguments

  - `name` instance method
    - should return a string starting with two capital letters between A-Z followed
    by 3 digits (0-9) - names should be random and follow no predictable sequence
    - for a given `Robot` object, the name should stay the same unless reset by the
    `reset` instance method
    - don't allow use of the same name twice
    - different `Robot` objects should have different names

  - `reset` instance method
    - wipes the `Robot` object's current name
    - the next time `name` is called on that `Robot`, a *new* random name should
    be generated
--------------------
Data Structure:
- `name` instance method
  - returns a string
  - may be useful to use arrays to construct the name (to randomly sample elements
  to add to the name)
  - use an array to keep track of already used names
--------------------
Algorithm:
- constructor method
  - initialize instance var `@name` to `nil`

- `Robot` class
  - set a class variable `@@used_names` to an empty array, to store used names

- `name` instance method
  - if `@name` is `nil`, then assign `@name` to the value returned by `create_robot_name`
  - otherwise, return `@name`

- `create_name` helper method
  - initialize empty string
  - initialize loop:
    - 2 times: add letter A-Z to empty string
    - 3 times: add digit 0-9 to string
    - break unless `@@used_names` already contains the name string
  - add the name string to `@@used_names`
  - return the name string

- `reset` instance method
  - assign `@name` to `nil`

- writer method for `@name`
=end

class Robot
  @@used_names = []

  def initialize
    @name = nil
  end

  def name
    @name.nil? ? self.name = create_name : @name
  end

  def reset
    @@used_names -= [@name]
    self.name = nil
  end

  private

  attr_writer :name

  def create_name
    name_str = nil

    loop do
      name_str = ''
      2.times { name_str += ('A'..'Z').to_a.sample }
      3.times { name_str += ('0'..'9').to_a.sample }
      break unless @@used_names.include?(name_str)
    end

    @@used_names << name_str
    name_str
  end
end
