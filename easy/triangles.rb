=begin
Problem & Requirements:
+ - create a `Triangle` class which new `Triangle` objects can be instantiated from

+  - `Triangle` objects should be instantiated with 3 arguments: the length of each
  of their sides
+    - If a `Triangle` object is instantiated with one its arguments having value
    <= 0, an ArgumentError should be raised
+    - `Triangle` objects must be instantiated where the sum of the lengths of any
    two sides must be greater than the length of the third side. Otherwise, an
    ArgumentError should be raised
      - side1 + side2 > side3
      - side2 + side3 > side1
      - side3 + side1 > side2

+  - `Triangle` objects should have a public instance method available to them: `kind`
+    - If a `Triangle` object has all 3 sides equal, calling the `kind` method on that
    triangle should return the string `equilateral`
+    - If a `Triangle` object has any 2 sides equal, calling the `kind` method on that
    triangle should return the string `isosceles`
+   - If a `Triangle` object has no sides equal, calling the `kind` method on that
    triangle should return the string `isosceles`
--------------------------
Data Structures:
- `Triangle` object side lengths will be represented by Integers and/or Floats
- The `Triangle#kind` method will return a string
- `Triangle` object side lengths could be stored in an Array?
--------------------------
Algorithm
=end

class ZeroOrNegativeSideError < ArgumentError; end
class SizeInequalityError < ArgumentError; end

class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [side1, side2, side3]
    raise ZeroOrNegativeSideError.new, 'all sides must be > 0' if zero_or_negative_side
    raise SizeInequalityError.new unless valid_side_lengths
  end

  def kind
    if side1 == side2 && side2 == side3
      'equilateral'
    elsif side1 == side2 || side2 == side3 || side3 == side1
      'isosceles'
    else
      'scalene'
    end
  end

  private

  attr_reader :side1, :side2, :side3, :sides

  def zero_or_negative_side
    sides.any? { |side| side <= 0 }
  end

  def valid_side_lengths
    side1 + side2 > side3 &&
    side2 + side3 > side1 &&
    side3 + side1 > side2
  end
end