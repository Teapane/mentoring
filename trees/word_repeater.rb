require 'pry'
def indices(word)
  # break word into characters
  # iterate over it and take letter and index
  # add indices to a new array
  # in ruby, each_with_index is an enumerable that allows us to iterate over a collection and keep track of the index
  data = word.chars.each_with_index.inject([]) do |indices, (char, index)|
    indices << index if char == 'e'
    indices
  end
  data.minmax
end


def word_count(string)
  # Example: given "This is a sample string",

  #       return "ssss    iiiaaTeghlmnprt"

  # Given a string, return a new string of equal length with the same
  # characters rearranged in decreasing order of number of occurrences.
  # let's use a hash to keep track of the count
  # Do we want to handle spaces?
  # Special characters?
  # letter_count = string.chars.inject(Hash.new(0)) do |counted_chars, character|
  #   counted_chars[character] += 1
  #   counted_chars
  # end
  count_hash_map = string.chars.group_by do |key, value|
    key
  end
  binding.pry
  count_hash_map.values.join("")
end

puts indices("heeeeello")
puts word_count("This is a sample string")

