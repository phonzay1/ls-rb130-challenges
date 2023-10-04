# rubocop:disable Layout/LineLength
=begin
Problem/Requirements:
- `Element` class
  - constructor method
    - takes 2 args: 1) the datum to be stored by that element (test cases all show
    numbers 1-10), 2) an optional arg: `Element` obj which is the next in the list
    (defaults to `nil`)

  - `datum` instance method
    - returns the datum stored by the element

  - `tail?` instance method
    - returns `true` if the element is at the tail of the linked list (examples show it defaulting
    to true, even if the element isn't part of a list...)

  - `next` instance method
    - new elements should default to returning `nil`
    - returns the next element in the linked list, if assigned

- `SimpleLinkedList` class
  - constructor method
    - takes no args
    - new lists are empty by default

  - `empty?` instance method
    - should return truthy value for an empty list

  - `push` instance method
    - adds element to list, and links it to the previously added el (@tail should
    be false for the added el)

  - `size` instance method
    - returns size of list

  - `peek` instance method
    - returns the next element in the list? or the `head` element?
      - examples return either the first or last element in the list
    - returns `nil` for empty list

  - `head` instance method
    - returns last-added element in the list, which is an `Element` object

  - `pop` instance method
    - returns and destructively removes the head element from the list

  - `from_a` class method
    - takes one arg, an array
    - returns a `SimpleLinkedList` obj with the arg array as the list
    - passing in `nil` results in an empty list
    - for the passed in array: the element at index 0 is the head, linked to the
    element at index 1, etc

  - `to_a` instance method
    - returns an Array object representing the list

  - `reverse` instance method
    - reverses the order of the list - including which element is the head and
    which is the tail

--------------------
Data Structure:
- use an `Array` object to hold the list, for built-in functionality and iterating
over elements
--------------------
Algorithm:
- `Element` class
  - constructor method
    - take and save 2 args: `datum` and `next` (optional, defaults to `nil`)

- `SimpleLinkedList#reverse` method
    - assign `reversed_data` to (reverse the order of elements in `@list` and transform
    them to their respective data)
    - use `SimpleLinkedList::from_a` to return a `SimpleLinkedList` object with
    the elements in the correct order and linking
=end
# rubocop:enable Layout/LineLength

class Element
  attr_accessor :datum, :next, :tail, :head

  def initialize(datum, next_el=nil, tail=true, head=true)
    @datum = datum
    @next = next_el
    @tail = tail
    @head = head
  end

  alias tail? tail
end

class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def empty?
    list.empty?
  end

  def push(datum)
    if list.empty?
      list.push(Element.new(datum))
    else
      list.last.head = false
      list.push(Element.new(datum, list.last, false))
    end
  end

  def size
    list.size
  end

  def peek
    list.empty? ? nil : head.datum
  end

  def head
    list.select { |el| el.head }.last
  end

  def pop
    el = list.pop
    list.last.head = true unless list.empty?
    el.datum
  end

  def to_a
    list.map { |el| el.datum }
  end

  def reverse
    reversed_data = list.reverse.map(&:datum)
    SimpleLinkedList.from_a(reversed_data)
  end

  def self.from_a(array)
    new_list = new
    array.reverse_each { |datum| new_list.push(datum) } unless array.nil?
    new_list.list.reverse!
    new_list
  end
end

# p Element.new(2).next
# p Element.new(2).tail?
# p SimpleLinkedList.from_a([1, 2, 3]).list.reverse
