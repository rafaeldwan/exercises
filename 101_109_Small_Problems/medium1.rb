### 101-109 Small Problems > Medium 1

require 'pry'

def rotate_array(arr)
  result = arr.dup
  result << result.shift
end

# further

def rotate_string(string)
  rotate_array(string.chars).join
end

def rotate_int(int)
  rotate_string(int.to_s).to_i
end


# Rotation (Part 2)

def rotate_rightmost_digits(int, size)
  strung = int.to_s
  if strung.length == size
    rotate_int(int)
  else
  (strung[0..(strung.length - (size+1))] + rotate_string(strung[-size..-1])).to_i
  end
end


# Rotation (Part 3)

def max_rotation(int)
  counter = int.to_s.length
  int.to_s.length.times do
    int = rotate_rightmost_digits(int, counter)
    counter -= 1
  end
  int
end

735291
352917
329175
321759
321597
321579

# def max_rotation(int)
#   count = int.to_s.length
#   count.times do 
# end



# 1000 Lights

# Given = (number of lightbulbs)
# Return = there a's a hash: each number from one to number of lightbulbs is on 
# or off. starting at all off, every one lightbulb is switched on. then every 
# second lightbulb is switched on. then every third. etc. through the total number
# of lightbulbses

# we'll make a hash by iterating through the full range
# then we'll do a nested loop through which switches booleans every n elements, then
# add 1 to n until. finally we'll select the keys of the hash which equal true
# and return that array

def which_are_on(int)
  bulbs = Hash.new
  (1..int).each { |i| bulbs[i] =  false }
  i = 1
  loop do 
    x = 1
    loop do
      index = x * i
      break if index > int
      bulbs[index] = !bulbs[index]
      x += 1
    end
    i += 1
    break if i > int
  end
  bulbs.select { |_, x| x == true }
end


# Diamonds!

# Yay!

# given = int
# return = display that diamond
# rules: always odd

# we'll use center instead of messing with spaces

def diamond(int)
  x  = 1
  while x <= int 
    puts ("*" * (x)).center(int)
    x += 2
  end
  x -= 2
  while x > 1
    x -= 2
    puts ("*" * (x)).center(int)
  end
end


# Stack Machine Interpretation


# Given: string of commands
# Return: Return & possible output of the commands

# Rules: 

# n Place a value n in the "register". Do not modify the stack.
# PUSH Push the register value on to the stack. Leave the value in the register.
# ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
# SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
# MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
# DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
# MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
# POP Remove the topmost item from the stack and place in register
# PRINT Print the register value


# All numbers will be ints. 
# All programs will be correct (not neccesarily all inputs)


# take the string input and break it into words
# initialize the register at 0
# initialize stack as new array
# pass words through a case statement which performs the correct values

def invalid_input(command)
  return "->>SORRY, NO COMPRENDO \"#{command}\"." 
end

def stackerror(command)
  return "->>CAN'T DO #{command.upcase} BUDDY, STACK IS EMPTY"
end

COMMANDS = %w(n print push add div mult mod sub pop)

def minilang(string)
  register = 0
  stack = []
  int = nil
  string = string.downcase.split
  string.each do |command|
    int, command = command.to_i, 'n' if command.to_i.to_s == command
    return invalid_input(command) unless COMMANDS.include?(command)
    unless COMMANDS[0..2].include?(command)
      return stackerror(command) if stack.empty?
    end
    case command
    when 'n' then register = int
    when 'push' then stack << register
    when 'add' then register += stack.pop
    when 'sub' then register -= stack.pop
    when 'mult' then register *= stack.pop
    when 'div' then register /= stack.pop
    when 'mod' then register %= stack.pop
    when 'pop' then  register = stack.pop
    when 'print' then puts register
    end
  end
  return nil
end

# minilang('PRINT')
# # 0

# minilang('5 PUSH 3 MULT PRINT')
# # 15

# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# # 5
# # 3
# # 8

# minilang('5 PUSH POP PRINT')
# # 5

# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# # 5
# # 10
# # 4
# # 7

# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# # 6

# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# # 12

# minilang('-3 PUSH 5 SUB PRINT')
# # 8

# minilang('6 PUSH')
# # (nothing printed; no PRINT commands)

# (3 + (4 * 5) - 7) / (5 % 3)

# minilang("GIGGITY 5 PRINT")

# 3 + (4 * 5)

# minilang("3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT PUSH 3 ADD SUB DIV PRINT")


# Word to Digit

given: string
return: string with words one-nine to string

create a constant arr
split the string
map to new array based on index

NUMBEES = %w(zero one two three four five six seven eight nine)

def word_to_digit(string)
  string.split.map do  |word| 
  
  if word[-1].match(/[^a-z]/i)
    word[0..-2] = NUMBEES.index(word[0..-2]).to_s if NUMBEES.include?(word[0..-2])
  end
    
  NUMBEES.include?(word) ? NUMBEES.index(word).to_s : word  
  
  end.join(" ")
end


# Fibonacci sequence

def fibonacci(n)
  return 1 if n <= 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

def fibonacci(n)
  first, last = [1, 1]
  3.upto(n) do
    first, last = [last, first + last]
  end
  last
end



def fiboeasy(n)
  return 1 if (1..2) === n
  result = 1
  seed = 1
  (n - 2).times do
    holdover = result
    result += seed
    seed = holdover
    result
  end
  result
end

def fibonacci_last(n)
  fibonacci(n).to_s.split("").pop.to_i
end

1
0 + 1 = 1
1 + 1 = 2
1 + 2 = 3
2 + 3 = 5
3 + 5 = 8
5 + 8 = 13


