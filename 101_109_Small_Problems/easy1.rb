### 101-109 Small Problems > Easy 1

require 'pry'


# Repeat Yourself

def repeat(string, int)
  int.times {p string}
end

repeat("Wowwee Zowee", 3)


# Odd


def is_odd?(int)
  int % 2 != 0
end

def is_odd_remainder?(int)
  int.remainder(2) != 0
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts "---"
puts is_odd_remainder?(2)
puts is_odd_remainder?(5)
puts is_odd_remainder?(-17)
puts is_odd_remainder?(-8)


# List of Digits

puts "***LIST OF DIGITS****"
def digit_list(int)
  int = int.to_s.split("")
  int.map { |i| i.to_i}
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]


# How Many

puts "\n***HOW MANY?***\n"

def count_occurrences(input_array)
  comparison_hash = {}
  iterator = 0
  input_array.length.times do
    if comparison_hash[input_array[iterator]]
      comparison_hash[input_array[iterator]] += 1
    else
      comparison_hash[input_array[iterator]] = 1
    end
    iterator += 1
  end
  comparison_hash.each {|key, value| puts "#{key} => #{value}" }
end

# OR, AFTER READING THROUGH POSSIBLE SOLUTIONS

def count_occurences_pretty(input_array)
  
  input_array.uniq.each { |value| puts "#{value} => #{input_array.count value}"}
  
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
count_occurrences(vehicles)
count_occurences_pretty(vehicles)


# Reverse It (Part 1)

def reverse_sentence(string)
  #backwords = []
  #words = string.split(" ")
  # words.length.times do
  #  backwords.push words.pop
  #end
 string.split.reverse.join(" ")
end

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'


# Reverse It (Part 2)


def reverse_words(string)
  
  words = string.split
  reversed=[]
  words.each do |word| 
    if word.length > 4
      reversed.push word.reverse 
    else 
      reversed.push word
    end
  end
  reversed.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


###Stringy Strings###


def stringy(num, starter = 1)
  result = ""
  rotateme = ["0", "1"]
  rotateme.rotate! if starter == 0
  num.times {result += rotateme.rotate![0]}
  result
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7, 0) == '0101010'


# Array Average


def average(numbers)
  total = 0
  numbers.each {|i| total += i}
  (total.to_f / numbers.length)
end

puts average([1, 5, 87, 45, 8, 8]) #== 25.0
puts average([9, 47, 23, 95, 16, 52]) #== 40.0


# sum of digits


# only works past 2.4.0:
def sum(int)
  int.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
  

# What's my bonus


def calculate_bonus(salary, boss_not_a_dick)
  return 0 unless boss_not_a_dick
  salary / 2
end

def better_calculate_bonus(salary, boss_not_dick)
  boss_not_a_dick ? (salary / 2) : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
  