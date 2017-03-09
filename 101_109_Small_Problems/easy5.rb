### 101-109 Small Problems > Easy 5

require 'pry'


# ASCII String Value

def ascii_value(string)
  string.chars.map(&:ord).sum
end

# further exploration: Integer#chr


# After Midnight (Part 1)

# Input: any positive integer
# Output - corresponding time in 24 hr format
# Rules - no date and time classes
# If the number is positive, it represent the minutes since midnight
# If negative, minutes before midnight

# Break the integer up into hours by dividing by 60, the remainder are the minutes.
# Remainder of 24 should give the right number for integers larger than a day
# Subtract from 24 & 60 if negative
# Format and return the string
#     insert a leading zero to both variables if their string length is 1


def time_of_day(int)
    hour = (int / 60) % 24
    minute = int % 60
    # minute = 60 - minute if minute < 0
    # hour = 24 - minute if minute < 0
    time_arr = [hour, minute].map { |x|  x.to_s.length == 1 ? "0#{x}" : x.to_s }
    "#{time_arr[0]}:#{time_arr[1]}"
end

# After Midnight (Part 2)

# input = 24 hour time 00:00
# output - minutes since midnight, minutes after midnight
# rules = on date or time classes, ignore edge cases

# get first two and last two values of string as integers
# for hours multiply by 60 = minutes sinced midnight, minutes good as given unless 1440
# subtract from 1440 for minutes since midnight unless 0

def after_midnight(time)
  hour = time[0,2].to_i
  min = time[3,2].to_i
  hour *= 60
  hour + min == 1440 ? 0 : hour + min
end

def before_midnight(time)
  result = after_midnight(time)
  result == 0 ? 0 : 1440 - result
end
  

# Letter Swap

# input: string of words separated by spaces
# output: same string with first and last letter of every word swapped
# rules: all words at least 1 letter, all strings at least 1 word. no edges

# split the string by spaces into array
# remove and store both first and last of each word in array
# join array together as string and return

def swap(string)
  words = string.split
  words.each do |word|
    new_first = word[-1]
    new_last = word[0]
    word[0], word[-1] = new_first, new_last
  end
  words.join(" ")
end

# Clean up the words

# given = string with words and non-alphanumerics
# return = same string with only alphnumerics with non-a's replacced with spaces
# rules = never consecutive spaces - leading and ending spaces preserved

def cleanup(string)
  string.gsub!(/[^a-z ^A-Z]/, " ").squeeze(" ")
end

# further exploration

def cleanup(string)
  index = 0
  string.length.times do
    string[index] = " " unless ("A".."z").cover?(string[index])
    index += 1
  end
  string.squeeze(" ")
end


# Letter Counter (Part 1)

# input = string of "words"
# output = hash with words lenghts as key, number of words with 
# that length as values
# rules = words are any string of characters without a spaces

# string to array
# iterate through array outputing new hash which creates 
# zeroed index of element's length if not already created then 
# adds + 1


def word_sizes(string)
  string.split.each_with_object({}) do |word, array|
    # array[word.length] ||= 0 # my initial solution, works
    array.default = 0
    array[word.length] += 1
  end
end


# Letter Counter (Part 2)

# same as previous but discount non-letters
# rule: apostrophe needs to be erased

# what about accents??? ASCII search? other edge cases?

# to replace the apostrophe I need a regex that finds non-letters
# surrounded by letters instead of spaces, replace with ""
# then run the normal cleanup on the other

def cleanup(string)
  string.gsub!(/[^a-z ^A-Z]/i, "")
end

def word_sizes(string)
  newstring = string.split.each { |word| cleanup(word) }.join(" ")
  newstring.split.each_with_object({}) do |word, array|
    # array[word.length] ||= 0 # my initial solution, works
    array.default = 0
    array[word.length] += 1
  end
end


# Alphabetical Numbers

# given - array of integers between 0 - 19
# return - array of those integers sorted alphabetically by english words


# iterate through given array, return with new array in correct alphabetical orde

# create a lookup table array of strings, one alphabetical, one in numberical order
# use the first to look up the name of

WORDS = %w(zero, one, two, three, four, five, six, seven, eight, nine, ten,
           eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, 
           eighteen, nineteen)
SORTED_WORDS = WORDS.sort

WORD_HASH = {}

SORTED_WORDS.each_with_index { |x, i| WORD_HASH[x] = i  }
           
def alphabetic_number_sort(num_arr)
  return_hash = {}
  num_arr.each do |x|
    index = WORD_HASH[WORDS[x]]  
    return_hash[index] =  x
  end
  return_hash.sort.map { | x | x[1] }
end
  
def alphabetic_number_sort(array)
  array.sort_by { |i| WORDS[i] }
end


# ddaaiillyy ddoouubbllee

  given - string argument
  return - new string with all consecutive duplicate characters condensed
  
  chars in string to array,
  iterate through aray, put current letter into var, delete if var = current
  letter, collapse back into string
  
def crunch(string)
  letters = string.chars
  ref = ""
  crunched = letters.map do |letter| 
    result = letter unless letter == ref
    ref = letter
    result
  end
  crunched.join
end
      
    
# Bannerizer

given - string
output - string with a box around it

print "+-" string length times"-" "-+", 
"| "string" |"
"| " string length  time " ", " |"
string length times"-" "-+", 


def print_in_box(string)
  puts "+-#{'-' * string.length}-+"
  puts "| #{' ' * string.length} |"
  puts "| #{string} |"
  puts "| #{' ' * string.length} |"
  puts "+-#{'-' * string.length}-+"
end