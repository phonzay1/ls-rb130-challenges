=begin
Problem/Requirements:
- `CustomSet` class

  - constructor method:
    - accepts an optional argument: an array of numbers. If no argument is passed,
    the set should default to a state of empty

  - `#empty?` method:
    - returns true if the set contains no elements, false otherwise

  - `#contains?` method:
    - accepts one argument, a number
    - returns true if the set contains the argument, false otherwise

  - `#subset?` method:
    - accepts one argument, a `CustomSet` object
    - returns true if the elements in the calling `CustomSet` can be considered
    a subset of the elements in the argument - if each element from the calling
    set is included in the argument set
    - an empty set is considered a subset of both empty and non-empty sets

  - `#disjoint?` method:
    - accepts one argument, a `CustomSet` object
    - returns true if there are no common elements between the calling `CustomSet`
    and the argument, false if there are shared elements.
    - an empty set is considered disjointed with both other empty and non-empty
    sets

  - `#eql?` method:
    - accepts one argument, a `CustomSet` object
    - returns true if the elements in the calling `CustomSet` are the same as the
    elements in the argument `CustomSet`:
      - order doesn't matter
      - duplicates don't matter (i.e. [1, 2, 2, 2] equals [1, 2])
    - an empty set is considered equal to another empty set (but not a non-empty
    set)

  - `#==` method:
    - not listed explicitly in tests, but will be needed to compare `CustomSet`
    objects
    - follows same rules as `#eql?`

  - `#add` method:
    - accepts one argument, a number
    - adds the argument to the elements of the calling `CustomSet`, unless the caller
    already contains that number
    - returns the calling object with the element added - mutates the caller

  - `#intersection` method:
    - accepts one argument, a `CustomSet` object
    - returns a new `CustomSet` obj where the elements are those included in both
    the calling and argument object
    - if either the caller or the argument represents an empty set, an empty set
    is returned

  - `#difference` method:
    - accepts one argument, a `CustomSet` object
    - returns a new `CustomSet` obj where the elements are those of the calling
    object "minus" those of the argument, if applicable (or should it mutate the
    caller? not clear from tests)

  - `#union` method:
    - accepts one argument, a `CustomSet` object
    - returns a new `CustomSet` obj where the elements are those of the calling
    object added to those of the argument - if there are duplicates, they should
    be included only once in the return value (or should it mutate the
    caller? not clear from tests)

  *`Array#difference` and `Array#union` return *new* arrays, so we'll follow that
--------------------
Data Structure(s):
- you may assume that all elements of a set must be numbers
- the constructor method accepts an array
  - keeping the elements in an array provides access to built-in `Array` class
  functionality
--------------------
Algorithm:
=end

class CustomSet
  def initialize(array=[])
    @set = array.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other_set)
    set.all? { |num| other_set.contains?(num) }
  end

  def disjoint?(other_set)
    set.none? { |num| other_set.contains?(num) }
  end

  def ==(other)
     set.sort == other.set.sort
  end

  alias eql? ==

  def add(num)
    set.push(num) unless contains?(num)
    self
  end

  def intersection(other_set)
    results = set.select { |num| other_set.contains?(num) }
    CustomSet.new(results)
  end

  def difference(other)
    results = set - other.set
    CustomSet.new(results)
  end

  def union(other)
    results = (set + other.set).uniq
    CustomSet.new(results)
  end

  protected

  attr_reader :set
end