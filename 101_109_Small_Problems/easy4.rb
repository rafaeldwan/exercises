### 101-109 Small Problems > Easy 4

require "pry"

# Short Long Short

def short_long_short(string1, string2)
  return string1 + string2 + string1 if string1.length < string2.length
  string2 + string1 + string2
end


# What Century is That?

def century(year)
  end_with = ["_", "st", "nd", "rd"]
  cent = ((year+99) / 100).ceil
  #binding.pry
  if (1..3) === cent.to_s[-1].to_i && 1 != cent.to_s[-2].to_i #if it's 1..3 but not 11..13
    #ending = cent.to_s[-1].to_i
    return "#{cent}#{end_with[cent.to_s[-1].to_i]}"
  else
    return "#{cent}th"
  end
end

century(2001) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
  
  
# Multiples of 3 and 5

def multisum(num)
  result = []
  for x in 1..num
    result << x if x % 3 == 0 || x % 5 == 0
  end
  result.sum #only works ruby > 2.4.0
end

#further exploration

def multisum(num)
  result = []
  for x in 1..num
    result << x if x % 3 == 0 || x % 5 == 0
  end
  result.inject(:+)
end

#cool one from user submissions from memory
  
def multisum(num)
  (1..num).inject{ |sum, n| ((n % 3).zero? || (n % 5).zero?) ? sum + n : sum}
end


# Running totals

# create a new array
# start with the same number
# loop through, adding the next number in the original array to the preceding one in the new array

def running_total(arr)
  return [] if arr.empty?
  result = [arr[0]]
  if arr.length > 1
    index = 1
    total = arr[0]
    (arr.length - 1).times do
      total = result[index-1] + arr[index]
      result << total
      index += 1
    end
  end
result
end

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

# LS solution from memory (embarassing!)

def running_total(arr)
  sum = 0
  arr.map{ |num| sum += num}
end
  
# Further exploration

def running_total(arr)
  total = 0
  arr.each_with_object([]) { |num, new_arr| new_arr << total += num}
end


# Convert a String to a Number!

# lookup table
# go through character at a time
# multiply first character by string length
# second character by length -1 one, loop through

def string_to_integer(string_int)
  num_lookup = %w(0 1 2 3 4 5 6 7 8 9)
  pointer = 0
  value = 0
  multiplier = string_int.length - 1
  string_int.length.times do
    value += (num_lookup.index(string_int[pointer])) * (10 ** multiplier)
    multiplier -= 1
    pointer += 1
  end
  value
end

#further exploration - just changed two lines of code (and method name), no additional

def hexadecimal_to_integer(string_int)
  num_lookup = %w(0 1 2 3 4 5 6 7 8 9 A B C D E F)
  pointer = 0
  value = 0
  multiplier = string_int.length - 1
  string_int.length.times do
    value += (num_lookup.index(string_int.upcase[pointer])) * (16 ** multiplier)
    multiplier -= 1
    pointer += 1
  end
  value
end


# Convert a String to a Signed Number!

def string_to_signed_integer(string_int)
  if string_int[0] == "-"
    string_int.sub!("-", "")
    -(string_to_integer(string_int))
  elsif string_int[0] == "+"
    string_int.sub!("+", "")
    (string_to_integer(string_int))
  else
    (string_to_integer(string_int))
  end
end

# I like the LS way much more, just a great use of "case"

def string_to_signed_integer(string_int)
  case string_int[0]
  when "-" then -string_to_integer(string_int.sub("-", ""))
  when "+" then string_to_integer(string_int.sub("+", ""))
  else
    (string_to_integer(string_int))
  end
end


# Convert a Number to a String

# input = positive integer or zero
# output = that number as a string
# edge cases can be ignored

# create table for lookup in array (hash would work too)
# find the amount of characters
#   find length by looping successive % of multiples of 10 until % = int

#populate new array by looping through division by power of ten appropriate to amount of characters  
  

# * iterator until remainder equals the integer. use iterator to find length
# # loop through length amount of times dividing 
# appropriate power of ten 

# replace the broken down numbers as index lookups table, join

STRINGLOOKUP = %w(0 1 2 3 4 5 6 7 8 9)

def find_power(int)
  divisor = 1
  power = -1
  loop do 
    divisor *= 10
    power += 1
    break if int/divisor == 0
  end
  power
end
  
def integer_to_array(int)
  chars = []
  power = find_power(int)
  loop do
    if int == 0 
      chars << 0
    elsif 
      chars << int / (10 ** power)
      int -= (int / (10 ** power)) * (10 ** power)
    end
    power > 0 ? power -= 1 : break
  end
  chars
end

def integer_to_string(int)
  arr = integer_to_array(int)
  result = ""
  arr.each { |i| result += STRINGLOOKUP[i] }
  result
end
  
# further exploration:

# mutating methods without !

#bytes
#chars
#chr
#clear
#concat
#each_byte
#each_char
#each_codepoint
#each_line
#force_encoding
#replace
#insert
#inspect
#replace
#to_s
#to_str

# I could not find any methods with ! that 
# don't have a non-mutating form in String, Hash, or Array

# Better LS solution from memory:

def integer_to_string(number)
  result = ""
  loop do
    number, remainder = number.divmod(10)  
    result.prepend(STRINGLOOKUP[remainder])
    break if number == 0
  end
  result
end


# Convert a Signed Number to a String!

def signed_integer_to_string(int)
  return integer_to_string(int) if int == 0
  int >= 0 ? (integer_to_string(int).prepend("+")) : (integer_to_string(-int).prepend("-"))
end

# solution to further exploration from memory

def signed_integer_to_string(int)
  ["","+","-"][int <=> 0] + integer_to_string(int.abs)
end

