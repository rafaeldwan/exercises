### 101-109 Small Problems > Easy 6


# Cute angles

# given: floating point number 0-360
# return: formatted string that represents angle with mins and sec
# rules: use ˚ for degrees, ' per minute, " per second, 
# 60 mintes per degree, 60 degrees per second

# store floor. take remainder from 1, multiply by 60, store,
# take remainder from 1, multiply by 60,
# take floor, store
# create string, for minutes and second if integer to string length = 1 prepend 
# with zero

MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTES = 60
DEGREE_CEILING = 360

def dms(degrees)
  if degrees >= 0
    degree = (degrees.floor % DEGREE_CEILING).to_s
  else
    degrees = degrees.abs
    degree = ((degrees.floor % DEGREE_CEILING) * -1).to_s
  end
  minute = (degrees % 1) * MINUTES_PER_DEGREE
  second = (minute % 1) * SECONDS_PER_MINUTES
  minute =  minute.floor.to_s
  second = second.floor.to_s
  format(%(#{degree}°%02d\'%02d\"), minute, second)
end


# Delete vowels

# given: array of strings
# return: new array of the same strings, except with vowels removed

# iterate through array, gsubbing through each string to remove vowels

def remove_vowels(string_array)
  string_array.map { |string| string.gsub(/[aeiou]/i, "") }
end

# Fibonacci Number Location By Length

# given: integer
# return: index of fibonacci number where length = given integer
# rules: fib sequence = last number in sequence plus second to last in sequence

# create fib sequence - array 1, 1, then last index + second to last index
# iterate through fib sequence until length of number as string = given length
# add to return info each time

def fibonacci(int)
  seed = [1,1]
  if int < 3
    seed[int-1]
  else
    (int-2).times do
      seed << seed[-1] + seed [-2]
    end
    seed[int-1]
  end
end

def find_fibonacci_index_by_length(so_long)
  result = 0
  fib_return = 0
  until fib_return.to_s.length >= so_long
    result += 1
    fib_return = fibonacci(result)
    puts fib_return
  end
  result
end


# Reversed Arrays (Part 1)
  
  
# Given: Arrays
# Return: Same array, reversed elements

# Rules: no using the methods
# Tricks - excamples all all sorted

# let's do a sort, and realize we're in sort exercises now

def reverse!(list)
  list = list.sort! { |a, b| list.index(b) <=> list.index(a) }
end

list = [1,2,5,4]
list = %w(Peter Paul Mary)

# reversed Arrays (Part 2)

# given: array
# return: new array, reversed first array
# rule - do not modify original list

def reverse(arr)
  temp = arr.dup
  result = []
  result << temp.pop until temp.empty?
  result
end

#further exploration:

def reverse(array)
  array.each_with_object([]) { |x, array| array.unshift(x) }
end


# Combining Arrays

# Given: two arrays
# Return: new Array with all values from the argument arrays with no dupes

# add the two arrays, filter them for unique

def merge(first, second)
  (first + second).uniq
end


# Halvsies

# given: an array
# return: first half and second half in (array of) two arrays
# rules: if original array is odd, middle elemnt should be in first return

# halvsies([1, 2, 3, 4])
# halvsies([1, 5, 2, 4, 3])

# should be able to partition the original using length / 2

def halvsies(halvme)
  halvme.partition { |i|  halvme.length.to_f / 2 > halvme.index(i)}
end


# Find the Duplicate

# Given: unordered array with one dupes
# Return: dup value
# rule - none

# count each element, return if count == 2

def find_dup(arr)
  arr.select { |i| arr.count(i) == 2 }.uniq.join.to_i
end

def find_dup(arr)
  result = arr.sort_by { |i| arr.count(i) }
  result[-1]
end


# Does My List Include This?

# Given: Array, search value
# Return: true if search value is in the array, false otherwise
# Rules: no use Array#include?

# just use any? yeah? otherwise loop through to check

def include?(arr, search)
  arr.any? { |i| i == search }
end


# Right Triangles

def triangle(int) # corner 4
  star = 1
  space = int - 1
  int.times do
    puts "#{' ' * space}#{'*' * star}"
    star += 1
    space -= 1
  end
end

#further exploration

def upside_down_tri(int) # corner 2
  star = int
  space = 0
  int.times do
    puts "#{' ' * space}#{'*' * star}" 
    star -= 1
    space += 1
  end
end

def tri_corner(int, corner = 4)
  corner <= 2 ? star = int : star = 1
  corner <= 2 ? space = 0 : space = int -1
  int.times do
    if corner == 4 || corner == 2
      puts "#{' ' * space}#{'*' * star}" 
    else
      puts "#{'*' * star}#{' ' * space}"
    end
    corner <= 2 ? star -= 1 : star += 1
    corner <= 2 ? space += 1 : space -= 1
  end
end