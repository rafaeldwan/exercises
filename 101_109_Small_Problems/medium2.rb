### 101-109 Small Problems > Medium 2


# Longest Sentence

# Given: contents of a text file with a bunch o' sentences
# Return: PRint out longest sentence with words count


# Rules: Sentences end with .!?, any sequjence of characters that are not spaces or enders should be treated as word.

# ENDER = [".", "!", "?"]

# break into arreay nested loop with a loop through variable and and result variable


text = File.read('pg84.txt')
arr = text.split(/(?<=[?.!])\s*/)
answer = ""
size = nil
arr.each { |i| answer, size = i, i.split.size if i.split.size > answer.split.size }
puts "#{answer} >> WORD COUNT: #{size}"


# Now I Know My ABCs

# Given: word as a string
# Return: true if word can be spelled using blocks once each, false otherwise

# Blocks as nested array, Iterate through each letter, del from a blocks clone if
# match, return false if no match, true if it makes it through the loop

BLOCKS = %w(B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M)

def block_word?(word)
  blocks = BLOCKS.dup
  spelling = false
  word.chars.each do |char|
    spelling = false
    blocks.each do |block|
      break if spelling == true
      if block.include?(char.upcase)
        blocks.delete(block)
        spelling = true
      end
    end
  end
  spelling
end


# Lettercase Percentage Ratio

# given: string
# return: hash with percentage of string that is upcase, downcase, neither

# rules = count spaces

# split(""), if then with regex into respective arr key, divide by length


def letter_percentages(string)
  percentages = {}
  divisor = string.length
  percentages[:lowercase] = (string.scan(/[a-z]/).count).fdiv(divisor) * 100
  percentages[:uppercase] = (string.scan(/[A-Z]/).count).fdiv(divisor) * 100
  percentages[:neither] = 100 - percentages[:lowercase] - percentages[:uppercase] 
  percentages
end


# Matching Parentheses?

# given: string
# return: true if parentheses are properly balanced, false otherwise


def balanced?(string)
  check = 0
  string.chars.each do |i|
    check += 1 if i == "("
    check -= 1 if i == ")"
    return false if check < 0
  end
  return false if check > 0
end

#LS slightly more elegant solution from memory

OPEN = ["(", "[", "{",]
CLOSE = [")", "]", "}"]
AMBIGIOUS = "\'\""

# ignoring single and double lquote and rqoute, could be looked up easily enough

# ignoring apostrophe for conjunction, plural, ownership - headache, make 
# the task much more difficult if not impossible - 
# program can't tell if 'those were John's wives'' is balanced or not (wives' 
# could be possesive or plural, only context can tell )

def balanced?(string)
  check_it = 0
  return false if string.count(AMBIGIOUS).odd?
  string.each_char do |i|
   check_it += 1 if OPEN.include?(i)
   check_it -= 1 if CLOSE.include?(i)
   return false if check_it < 0
  end
  check_it.zero?
end


# Triangle Sides

# Lord this again

# given = 3 nums
# return = whether the triangle the sums make are Equilateral, Isoceles, Scalene, or invalid

# rules = 
#   equilateral = x == y == z
#   isosceles = x == y || x == z || y == z
#   scalene = x != y != z
#   valid = two smallest sides added together must be larger than the largest

def triangle(*side)
  side.sort!
  return :invalid if 
    side.size > 3 || 
    side.any? { |i| i <= 0 } ||
    side[2] > side[0] + side[1]
    
  case side.uniq.size
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end


# Tri-Angles


# Given: three ints as angles
# Return: Invalid, right, acute, or obtuse

# Rules: Ints. Arguments are in degrees.
# Valid = Sum must be 180, all angles > 0 

# so... check for valid, easy enough (none are 0, sum == 180)
# else if one is 90 right
#   if one is > 90 obtuse
#   else acute
    
    
def triangle(*angle)
  return :invalid if 
    angle.size != 3 ||
    angle.sum != 180 ||
    angle.include?(0)
  return :right if angle.include?(90)
  return :obtuse if angle.any? { |i| i > 90 }
  :acute
end


# Unlucky Days

# Given: Year
# Return: How many F the 13ths in that year
# Rules: no funny business

# educated myself about date, seems like mixing two of its methods will do
# - can almost copy and paste directly from the docs

# Date

require 'date'

def friday_13th?(year)
  Date.new(year).step(Date.new(year,-1,-1)).select{ |d| d.friday? && d.mday == 13 }.size
end


# Write a method that takes in an integer `offset` and a string.
# Produce a new string, where each letter is shifted by `offset`. You
# may assume that the string contains only lowercase letters and
# spaces.
#
# When shifting "z" by three letters, wrap around to the front of the
# alphabet to produce the letter "c".
#
# You'll want to use String's `ord` method and Integer's `chr` method.
# `ord` converts a letter to an ASCII number code. `chr` converts an
# ASCII number code to a letter.
#
# You may look at the ASCII printable characters chart:
#
#     http://en.wikipedia.org/wiki/ASCII#ASCII_printable_characters
#
# Notice that the letter 'a' has code 97, 'b' has code 98, etc., up to
# 'z' having code 122.
#
# You may also want to use the `%` modulo operation to handle wrapping
# of "z" to the front of the alphabet.
#
# Difficulty: hard. Because this problem relies on outside
# information, we would not give it to you on the timed challenge. :-)

# given: string
# return: string with each letter swapped for 3 +up in the ASCII table
# rules: wrap if going to run out of alphabet
# only lowercase and spaces

def offset(string, offset)
  string.chars.map do |x|
    if x.match?(/[a-z]/i)
      x = ((x.ord + offset)  % 122)
      x += 97 if x < 97
      x.chr
    else
      x
    end
  end.join
end

# string.map(& :chars).flatte.map { |x| x }


# Next Featured Number Higher than a Given Value


# Given: single integer
# Return: next featured number
# Rules: Featured number = odd number multiple of 7 with no recurring digits

# so we'll loop through, check for odd && % 7, then convert and check for repeats
# with size uniq == size, add 1 next

def featured(int)
  if int > 9_876_543_210
    p "DON'T BE CRAZY. THERE IS NO NUMBER LIKE THAT YOU LUNATIC YOU." 
    break
  end
  loop do
    int += 1
    return int if int.odd? && 
      int % 7 == 0 &&
      int.digits.uniq == int.digits
  end
end


# Bubble Sort

# iterate through, take first two, swap using assignment
# keep track of skipped with variable?

def bubble_sort!(arr)
  i = 0
  skipped = 0
  
  loop do
    if arr[i] > arr[i+1]
      arr[i], arr[i + 1] = arr[i+1], arr[i]
      skipped = 0
      i += 1
    else
      i += 1
      skipped += 1
    end
    
    break if skipped == arr.length - 1
    
    i = 0 && skipped = 0 if i == arr.length - 1
  end
end

# further exploration

def bubble_sort!(arr)
  i = 0
  new_arr = []
  
  loop do
    if arr[i] > arr[i+1]
      arr[i], arr[i + 1] = arr[i+1], arr[i]
      i += 1
    else
      i += 1
    end
    
    if i == arr.length - 1
      i = 0
      new_arr.unshift(arr.pop)
    end
    
    if arr.length == 1
      (arr << new_arr).flatten!
      break 
    end
  end
end


# Sum Square - Square Sum

# Given: number
# Return: square of sum of first n pos. ints - sum of squares of first n ints


# easy enough

def sum_square_difference(int)
  (1..int).sum ** 2 - (1..int).map { |i| i ** 2 }.sum
end