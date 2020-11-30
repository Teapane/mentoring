require 'pry'
#  number: Int
#  return Int
# we can use recursion here
# do we care about handling negative numbers?
# do negatives converge at zero as well??
# what about non int args?
# we can catch it all to start
def recursive_steps(number)
  return "Argument Error" if (number < 1  || !number.is_a?(Integer))

  # set a counter to zero
  steps = 0
  while number > 1
    number = number % 2 == 0 ? number/2 : (number * 3) + 1
    steps += 1
  end
  steps
end

def letter_frequency(string, frequency)
   #break immediately
   return "Argument Error #{string && frequency} do not match criteria!" if string.empty? || frequency < 0
   # sanitze the string of spaces
   # characters = string.gsub!(/\W+/, '')
   # create hash of count of letter
   character_count_hash_map = string.chars.each_with_object(Hash.new(0)) do |letter, freq|
     freq[letter] += 1
   end
   binding.pry
   formatted_string = character_count_hash_map.select { |key, value| value < frequency }.keys.join("")
   formatted_string
end

def convert(str, frequency)
  # one loop o(n)
  letter_array = str.chars.group_by {|x| x}.values
  binding.pry
  # drop_size = letter_array.map(&:size).min - 1
  letter_array.map { |x| x.drop }.join
end

# puts recursive_steps(27)
# puts recursive_steps(3)
# puts recursive_steps(122)
# puts recursive_steps(-1)
# puts recursive_steps(1000)
# puts iterative_steps(27)
puts letter_frequency("asssd", 3)
# puts convert("asssd", 3)
# puts letter_frequency("asssaad", 3)
# puts letter_frequency("asssaadduibncgdabedjale", 3)
