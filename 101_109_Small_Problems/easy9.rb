### 101-109 Small Problems > Easy 9


# Welcome Stranger

# Given: array of two or more elements which produces persons name when combined + spaces
# and a hash with :title and :occupation keys

# Return: Greeting using all supplied information

# Call all with interpolation. Combine array when calling.

def greetings(name_arr, job_hash)
  "WELL HELLO #{name_arr.join(' ').upcase}. I SEE YOU ARE A #{job_hash.values.join(' ').upcase}. THAT IS VERY SPECIAL FOR YOU."
end


# Double Doubles

given - int
return - int doubled unless first half of int === second half

check if length even, convert to string check if first half by index == 2nd half
return as directed

def twice(int)
  midpoint = (int.to_s.length / 2) - 1
  if int.to_s.length > 1 && int.to_s[(0..midpoint)] == int.to_s[((midpoint+1)..-1)]
    int
  else
    int * 2
  end
end


# Always Return Negative

# Given: number
# Return: negative number regardless of original

# abs of every number, negativize

def negative(num)
  -num.abs
end

def negative_long(number)
  number > 0 ? -number : number
end

num1 = 1
num2 = 0 
num3 = -1
Benchmark.bmbm do |x|
  x.report("negative for 1") { negative(num1) }
  x.report("negative for 0") { negative(num2) }
  x.report("negative for -1") { negative(num3) }
  x.report("negative_long for 1") { negative_long(num1) }
  x.report("negative_long for 0") { negative_long(num2) }
  x.report("negative_long for -1") { negative_long(num3) }
end
  
  
# Counting Up

Given: positive int
Return: array of all ints in sequence between 1 and given int

do a upto loop concatenating x to the return array at every iteration

def sequence(int)
  sequence_arr = []
  if int > 0
    1.upto(int) { |x| sequence_arr << x }
  else
    1.downto(int) { |x| sequence_arr << x }
  end
  sequence_arr
end

# better solution based on ls

def sequence(int)
  int.positive ? 1.upto(int).to_a : 1.downto(int).to_a
end


# Uppercase Check

def uppercase?(string)
  string.upcase == string
end


# How long are you?

# Given: string
# Return: array of every word in the string with " #{word.length}" appended

def word_lengths(string)
  string.split.map { |word|  "#{word} #{word.length}" }
end


# Name Swapping

# given: string that contains a "first last"
# return "last, first"

def swap_name(name)
  name = name.split
  "#{name.pop}, #{name[0]}"
end

# better LS solution from memory:

def swap_name(name)
  name.split.reverse.join(", ")
end


# Sequence Count

# Given: two int argument, first count, then seed number. 
# Return: array with count number of multiples of seed in order

def sequence(count, seed)
  arr = []
  count.times { |i| arr << seed * (i+1)}
  arr
end

# alt solution from LS from memory:

def sequence(count, seed)
  (1..count).map { |i| i * seed }
end


# Grade book

# I've done this one before!

Given: 3 ints 0-100

Return: Average grade of the three 

Get average of array using reduce. Apply average using a case statement to return grade.

def get_grade(*num)
  case num.reduce(:+) / num.count
  when 90...Float::INFINITY then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else
    'F'
  end
end


# Grocery List

Given: array of [fruit, int] arrays
Return: array of each fruit repeated int numbers of times


def buy_fruit(arr)
  result = []
  arr.each { |inner| inner[1].times { result << inner[0] }}
  result
end

# or

def buy_fruit(arr)
  result = []
  arr.each { |fruit, num| result << [fruit] * num }
  result.flatten
end

# or 

def buy_fruit(arr)
  arr.map { |fruit, num| [fruit] * num }.flatten
end

# or 

def buy_fruit(arr)
  arr.flat_map { |fruit, num| [fruit] * num }
end


