=begin
Problem & Requirements:
- Create a `DNA` class

  - constructor method:
    - takes one argument, the nucleotide sequence

  - `hamming_distance` method:
    - takes one argument, the nucleotide sequence to be compared
    - returns 0 if both sequences are identical, including if they're both empty strings
    - in sequences of the same length, returns the number of nucleotides which
    are different at the same string index in both sequences
    - when the the sequences are different lengths, returns the number of nucleotides
    which are different at the same string index in both sequences, up to the index
    of the shortest sequence
    - does not mutate either sequence!
--------------------
Data Structure:
- nucleotide sequences are strings
- `hamming_distance` method returns integers
- may want to split each sequence into an array of its characters for processing?
--------------------
Algorithm:
- Constructor method
  - save the passed in nucleotide sequence

- `hamming_distance` method
  - determine whether the calling `DNA` object's sequence is shorter, or the
  comparison object's sequence
  - initialize a `point_mutations` local variable to 0
  - iterate from index 0 up to the final index of the shortest sequence:
    - compare the character at each index in each sequence. If they're the same
    move on, if they're different increment `point_mutations` by 1
  - return `point_mutations`
=end

require 'pry'

class DNA
  def initialize(sequence)
    @nucleotides = sequence
  end

  def hamming_distance(comparison_sequence)
    shortest_sequence_size = [nucleotides.size, comparison_sequence.size].min
    shortest_sequence_size == 0 ? final_index = 0 : final_index = shortest_sequence_size - 1

    point_mutations = 0
    0.upto(final_index) do |index|
      point_mutations += 1 if nucleotides[index] != comparison_sequence[index]
    end
    point_mutations
  end

  private

  attr_reader :nucleotides
end

