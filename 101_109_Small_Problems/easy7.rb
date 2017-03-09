### 101-109 Small Problems > Easy 7


# Combine Two Lists

# given: two arrays
# return: new array with the elements of the two given placed in alterarion
# rules = both non-empty, both have same number of elements

# loop through, append element from each arr with the same index to new element

def interleave(first, second)
  result = []
  index = 0
  first.length.times do
    result << first[index] << second[index]
    index += 1
  end
  result
end

# further exploration

def interzip(first, second)
  first.zip(second).flatten
end


# Lettercase Counter

# Given: string
# Return: hash with three entries:  the number of upcase chars, downcase chars
# and neither

# seperate into chars, create formatted hash, iterate through check for alpha range 
# add to appropriate entry in hash


def letter_case_count(string)
  result = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |i|
    if ('a'..'z') === i
      result[:lowercase] += 1
    elsif ('A'..'Z') === i
      result[:uppercase] += 1 
    else
      result[:neither] += 1
    end
  end
  result
end


# Capitalize Words

# Given: string
# Return: new string, copy of old string with first letter if each words capitalized
# Rules: word = any sequence of non-blank chars, only need to consider first chars

# think I can split into an array, capitilize each string in the array, then join to new array

def word_cap(string)
  string.split.map(&:capitalize).join(" ")
end

# further exploration

def word_cap(string)
  result = string.downcase.split.map do |i| 
    i[0] = i[0].upcase
    i
  end
    result.join(" ")
end


#swapcase

# given: string
# return: string with the cases of each letter swapped

# break into chars, assign to upcase if lowercase = lowercase else vice versa

def swapcase(string)
  string.chars.map { |i| i.upcase == i ? i.downcase : i.upcase }.join
end


# Staggered Caps (Part 1)

# given: string
# return: new string with stagerred caps
# rules: characters that aren't letters remain the same but count in the string

# upcase the string, the downcase starting at one, adding 2 to the iterator

def staggered_case(string)
  string.chars.map.with_index { |x, i| i.odd? ? x.downcase : x.upcase  }.join
end


# Staggered Caps (Part 1)

# given: string
# return: new string with stagerred caps
# rules: characters that aren't letters remain the same but count in the string

# I'm gonna from the  LS solution for the last one from memory from this, with 
# a boolean switch. so upcase all, iterate through, downcase if the boolean is true
# , switch the boolean unless the char isn't in the alph range

def staggered_case(string, numbers_ignore = true)
  needs_down = false
  result = string.upcase.chars.each do |char|
    needs_down == true ? char.downcase! : char
    if numbers_ignore == true
      needs_down = !needs_down if ('A'..'z') === char
    else
      needs_down = !needs_down
    end
  end
  result.join
end

staggered_case('7ignore 77 the 444 numbers')
staggered_case('7ignore 77 the 444 numbers', false)


# Multiplicative Average

# give: array of ints
# return: result of multiply all array then divide by number of
# elements in array to 3 decimals

def show_multiplicative_average(arr)
  result = (arr.reduce(:*).to_f / arr.size)
  puts "The result is #{sprintf("%.3f", result)}"
end
  
  
# Multiply Lists

# Given: two arrays
# Return: single array with product of each pair of numbers at same index
# Rules: arrays equal size

# seems like there should be a simple method, but map with index will work

def multiply_list(arr1, arr2)
  arr1.map.with_index { |x, i| x * arr2[i] }
end


# [3, 5, 7].zip([9, 10, 11]) do |arr| 
#   arr1 = arr.pop
#   arr2 = arr.pop
#   arr.push(arr1 * arr2)
# end
# { |arr| p arr.pop * arr[0] }

# [2, 4].zip([4, 3, 1, 2])


# Multiply All Pairs

# Given: two arrays
# Return: single array with the product of each possible pair of numbers between
# the two arrays, sorted by increasing value

# Rules: nothing empty

# nested each?

def multiply_all_pairs(arr_1, arr_2)
  arr_1.product(arr_2).map { |arr| arr[0] * arr[1] }.sort
end

# more compact from LS solution, mainly to get map's treatment of arrays in my hands

def multiply_all_pairs(arr_1, arr_2)
  arr_1.product(arr_2).map { |num1, num2| num1 * num2 }.sort
end
  

# The End is Near But Not Here

# given: string
# return: next to last word in string
# rules: word is any sequence of non-blank chars

# string to array, second to last array element by negative index

def penultimate(string)
  result = string.split
  result[-2]
end

# further exploration 

# to find middle, find the index by  dividing array size by two. for simplicity, let it be the 
# two middle if the size is even

def middle(string)
  word_arr = string.split
  index = word_arr.length / 2
  if word_arr.length.even?
    word_arr[index - 1..index].join(" ")
  else
    word_arr[index]
  end
end


