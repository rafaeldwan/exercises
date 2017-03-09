### 101-109 Small Problems > Easy 8


# Sum of Sums

# given: array
# return: the sum of the sum of each leading subsequence
# rules: array contains at least one num

# get the sum of the array, pop off the last bit, do it until it's empty, sum the new array

def sum_of_sums(arr)
  value = 0
  until arr.empty? do
    value += arr.sum
    arr.pop
  end
  value
end


# Madlibs

puts "I MUST HAVE NOUN"
noun = gets.chomp.upcase

puts "I MUST HAVE VERB"
verb = gets.chomp.upcase

puts "I MUST HAVE ADJECTIVE"
adj = gets.chomp.upcase

puts "NOW AND ULTIMATELY YOU MUST GIVE ME ADVERB"
adverb = gets.chomp.upcase

puts "\"JEEPERS!\" SHE SAID #{adverb}. \"THAT #{adj} #{noun} SURE CAN #{verb}!\" HA! HA! HA!"


# Leading Substrings

# given: string
# return: array of substrings of string that start at the beginning of string,
# ordered from shortest to last

# break into chars, unshift onto return arr, pop off, return new arr

def substrings_at_start(string)
  substrings = []
  char_arr = string.chars
  until char_arr.empty? do
    substrings.unshift(char_arr.join)
    char_arr.pop
  end
  substrings
end


# All Substrings

def substrings(string)
  result = []
  temp = string.dup
  until temp.empty?
    result << substrings_at_start(temp)
    temp.slice!(0)
  end
  result.flatten
end


# Palidromic Substrings

# given: string
# return: array of all substrings that are palindromic
# rules: caps count. palidromes > 2 char

# run the substrings method,  map it out to new array checking it equals itself 
# reversed while its length is greater than 2

def palindromes(string)
  subs = substrings(string)
  subs.map { |word| word if word == word.reverse && word.length > 1 }.compact
end

# Further exploration

def palindromes_ignore_special(a_string)
  string = a_string.gsub(/[^a-z]/i, "")
  subs = substrings(string)
  subs.map { |word| word if word == word.reverse && word.length > 1 }.compact
end


# fizzbuzz

# I've done fizzbuzz before!

Given: starting number and ending number
Return: Print all numbers between the two numbers
        Unless  divisible by 3, print Fizz
        Or divisible by 5, print Buzz
        Or divisible by 3 & 5 print FizzBuzz
        
create range, iterate through, case argument for  remainder - first 3 and 5 then 
one at a time then print number

def fizzbuzz(start, last)
  fizzy = []
  (start..last).each do |int|
    if int % 3 == 0 
      int % 5 == 0 ? (fizzy << "FizzBuzz") : (fizzy << "Fizz")
    elsif int % 5 == 0 
      fizzy << "Buzz"
    else
      fizzy << int
    end
  end
  puts fizzy.join(", ")
end


# Double Char (Part 1)

Given: string
Return: string with every char repeateteteded

break into chars, map x 2, join the map

def repeater(string)
  string.chars.map { |char| char * 2 }.join
end


# Double Char (Part 2)

# given: string
# return: string with all consonants doubled

# same as last with an ternary operator checking if matches the regex

def double_consonants(string)
  string.chars.map { |char| char =~ /[b-z&&[^eiou]]/i ? char * 2 : char }.join
end    


# # Convert number to reversed array of digits

# given = positive int
# return = that int reversed, leading zeroes gone

# int to string, reverse string, back to int, deal with zeroes if it doesn'test

def reversed_number(int)
  int.to_s.reverse.to_i
end


# Get The Middle Character

def center_of(string)
  big = string.size
  big.even? ? string[(big / 2) - 1, 2] : string[(big / 2)]
end
  