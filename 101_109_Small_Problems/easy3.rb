### 101-109 Small Problems > Easy 3

require 'pry'

def prompt(message)
  puts "-->->>:>> #{message}"
end

def thinking
  3.times do
    5.times do
      sleep(0.3)
      print "."
    end
    sleep(0.4)
    prompt ""
  end
end


# Searching 101

=begin
class String
  def numeric?
    Float(self) != nil rescue false
  end
end

numbers = []

%w(1st 2nd 3rd 4th 5th last).each do |numberth|
  number = ""
  prompt "GIVE ME #{numberth.upcase} NUMBER:"
  loop do
    number = gets.chomp
    break if number.numeric?
    prompt "NUMBER! NUMBER! DUM! AGAIN!"
  end
  numbers << number
end

numbers.map!{|n|eval n} 
# I wanted to allow floats but return the array formatted as shown
# without quotation marks or trailing zeros.
# " "%g" % number.to_f " removed the trailing zero but returns a string
# which would be displayed in quotes
# so this seemed the best solution. #eval is apparently dangerous with
# raw input, but seems safe since I did the #numeric? check
check_this = numbers.pop
print "THE NUMBER #{check_this} SURE IS"
print "N'T" unless numbers.include?(check_this) 
puts " IN #{numbers}."


# Arithmetic Integer

prompt "NUMBER!"
number1 = gets.to_i
prompt "SECOND NUMBER!"
number2 = gets.to_i

puts("#{number1} + #{number2} = #{number1 + number2}")
puts("#{number1} - #{number2} = #{number1 - number2}")
puts("#{number1} * #{number2} = #{number1 * number2}")
puts("#{number1} / #{number2} = #{number1 / number2}")
puts("#{number1} % #{number2} = #{number1 % number2}")
puts("#{number1} ** #{number2} = #{number1**number2}")



# Counting the Number of Characters

prompt "GIVE ME WORD OR EVEN WORDS IF YOU FEEL CRAAAAZY"
words = gets.chomp
puts "YOU WILL BE HAPPY TO KNOW THERE ARE #{words.split.join.length} CHARACTERS IN #{words.upcase}."



### Multiplying Two Numbers


#this only works if for numerics and if the second number is an integer...
def multiply(x, y)
  result = 0
  y.times {result += x} if y > 0
  y.abs.times {result -= x} if y < 0 
  result
end

def multiply_as_given(x, y)
  x * y
end

symbolvar = :symbol
stringvar = "string"

puts multiply(5, 2)
puts multiply(5, 0)
puts multiply(0, 5)
puts multiply(5, -3)
puts multiply(-5, 3)
puts multiply(-5, -3)

puts "As given:"

puts multiply_as_given(5, 2)
puts multiply_as_given(5, 0)
puts multiply_as_given(0, 5)
puts multiply_as_given(5, -3)
puts multiply_as_given(-5, 3)
puts multiply_as_given(-5, -3)
# puts multiply_as_given(2, stringvar) # Returns TypeError
puts multiply_as_given(stringvar, 2)
# puts multiply_as_given(2, symbolvar) # Returns TypeError
# puts multiply_as_given(symbolvar, 2) # Returns NoMethodError


###Squaring an argument



def square(x)
  multiply_as_given(x, x)
end

puts square(2)
puts square (-2)
puts square (0)
# puts square (symbolvar) # returns MethodError
# puts square (stringvar) # returns TypeError

#further exploration

def power_to_n_as_given(base, exponent)
  result = base.to_f
  exponent.to_i.times{result = multiply_as_given(base, result)} if exponent >= 0
  exponent.to_i.abs.times{result = result / base} if exponent < 0
  result
end

def power_to_n(base, exponent)
  result = base
  exponent.times{result = multiply(base, result)} if exponent >= 0
  exponent.abs.times{result = result / base} if exponent < 0
  result
end

puts "Power to n as given:"

puts power_to_n_as_given(1,1)
puts power_to_n_as_given(1,2)
puts power_to_n_as_given(0,0)
puts power_to_n_as_given(0,2)
puts power_to_n_as_given(2,0)
puts power_to_n_as_given(2,3)
puts power_to_n_as_given(-2,3)
puts power_to_n_as_given(2, -3)
puts power_to_n_as_given(0.25,3.0)


puts "Power to n:"
puts power_to_n(1,1)
puts power_to_n(1,2)
puts power_to_n(0,0)
puts power_to_n(0,2)
puts power_to_n(2,0)
puts power_to_n(2,3)
puts power_to_n(-2,3)
puts power_to_n(2,-3)
=end


## Exclusive Or
=begin
def my_xor?(x, y)
  the_decider = 0
  the_decider += 1 if x
  the_decider += 1 if y
  the_decider == 0 || the_decider == 2 ? false : true
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

def xor?(x, y)
  (x && !y) || (y && !x)
end




puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

###Odd Lists

def oddities (oddling)
  result = []
  oddling.each_with_index {|x, i| result << x if i.even?}
  result
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

def eventualities (eventual)
  result = []
  eventual.each_with_index {|x, i| result << x if i.odd?}
  result
end

def anotherway(array)
  index = 1
  result = []
  while index < array.length do
    result << array[index] 
    index += 2
  end
  result
end

def andanother(array)
  result = []
  while array.length > 1 do 
    array.shift
    result << array.shift
  end
  result
end

def yetanother (array)
  array.partition.with_index {|_, index| index.odd?}.first
end

def andagain (array)
  array.reject.with_index {|_, index| index.even?}
end

def lastone (array)
  (1...array.length).step(2).map {|index| array[index]}
end
  


puts "eventualities"
puts eventualities([2, 3, 4, 5, 6]) == [3, 5]
puts eventualities(['abc', 'def']) == ['def']
puts eventualities([123]) == []
puts eventualities([]) == []
puts "anotherway"
puts anotherway([2, 3, 4, 5, 6]) == [3, 5]
puts anotherway(['abc', 'def']) == ['def']
puts anotherway([123]) == []
puts anotherway([]) == []
puts "andanother"
puts andanother([2, 3, 4, 5, 6]) == [3, 5]
puts andanother(['abc', 'def']) == ['def']
puts andanother([123]) == []
puts andanother([]) == []
puts "yetanother"
puts yetanother([2, 3, 4, 5, 6]) == [3, 5]
puts yetanother(['abc', 'def']) == ['def']
puts yetanother([123]) == []
puts yetanother([]) == []
puts "andagain"
puts andagain([2, 3, 4, 5, 6]) == [3, 5]
puts andagain(['abc', 'def']) == ['def']
puts andagain([123]) == []
puts andagain([]) == []
puts "lastone"
puts lastone([2, 3, 4, 5, 6]) == [3, 5]
puts lastone(['abc', 'def']) == ['def']
puts lastone([123]) == []
puts lastone([]) == []

=end


### Palindromic Strings

def palindrome?(string)
  string.reverse == string
end


def palindromed?(array)
  reversed = []
  array.each do |i|
    reversed.unshift(i)
  end
  reversed == array
end

def palindromy?(object)
  reversed = object.class.new
  index = object.length - 1
  backdex = 0
  object.length.times do
    reversed[backdex] = object[index]
    index -= 1
    backdex += 1
  end
  reversed == object
end
  
puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true
puts palindromed?([1,0,1]) #== true
puts palindromy?('madam') == true
puts palindromy?('Madam') == false          # (case matters)
puts palindromy?("madam i'm adam") == false # (all characters matter)
puts palindromy?('356653') == true
puts palindromy?([1,0,1]) #== true

def real_palindrome?(string)
  string.gsub!(/[^0-9a-z]/i, '')
  string.downcase.reverse == string.downcase
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false

def really_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

puts really_palindrome?('madam') == true
puts really_palindrome?('Madam') == true           # (case does not matter)
puts really_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts really_palindrome?('356653') == true
puts really_palindrome?('356a653') == true
puts really_palindrome?('123ab321') == false


def palindromic_number?(num)
  backwords = num.to_s.reverse.to_i
  backwords == num
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true