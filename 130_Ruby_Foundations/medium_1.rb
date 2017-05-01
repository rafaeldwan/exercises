### 130 Ruby Foundations: More Topics > Medium 1

require 'irb'
class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end
  
  def listen
    record(yield) if block_given?
  end
  
  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play


# Text Analyzer - Sandwich Code 

class TextAnalyzer
  def process
    file = File.open('sample.txt')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split("\n\n").size} paragraphs"}
analyzer.process { |file| puts "#{file.split("\n").size} lines." }
analyzer.process { |file| puts "#{file.split.size} words." }

# 3 paragraphs
# 25 lines
# 306 words


# Passing Parameters Part 1

def gather(items, &block)
  &block.call(items)
end


# Passing Parameters Part 2

def pass_to_block(birds)
  yield(birds)
end

birds = %w(raven finch dodo hawk eagle)

pass_to_block(birds) do | _, _, *no_explicit_use, prey, prey_2 |
  birds_of_pray = [prey, prey_2]
  p birds_of_pray
end

# Passing Parameters Part 3

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1

gather(items) do | *all_but, the_last |
  puts all_but.join(", ")
  puts the_last.to_s
end

# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

# 2

gather(items) do | first, *middle, last |
  puts first
  puts middle.join(", ")
  puts last
end

# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

# 3

gather(items) do | first, *remainder |
  puts first
  puts remainder.join(", ")
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

# 4 


gather(items) do | apples, corn, cabbage, wheat |
  puts "#{[apples, corn, cabbage].join(", ")}, and #{wheat}."
end

# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!


# Exploring Procs, Lambdas, and Blocks: Definition and Arity

# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# Procs: to_s outputs an object id, returns nil, class is proc,
# call with no parameters works, outputs nil, call with parameter works, 
# outputs nil.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# Lambdas: Class is proc. To_s outputs a proc object id with "(lambda)"" appended, returns nil. Lambda seems
# to be a method not a class since you can't call it as new and it is not capitilized.
# # No idea what the -> symbol means. Call with no arguments throws Argument Error
# (main difference from Proc). 

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1

# block method needs to pass an argument. Blocks will still function
# without given argument and not throw error, although they will throw error if
# no block is given

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

# yielding works when passed an argument. only passes specified number in method,
# doesn't matter how many block is expecting, although it will complete with
# nil rather than throw an error if it is given a block argument. If no block 
# argument is given it will throw a NameError. Blocks throw an error if variable
# referenced is not within its scope

Comparison:
Procs and lambdas behave very similarly but lambdas will throw errors if they
receive the wrong number of arguments. Blocks are not named. 


# Exploring Procs, Lambdas, and Blocks: Returning

# Group 1
def check_return_with_proc
  my_proc = proc { return }
  my_proc.call
  puts "This will never output to screen."
end

check_return_with_proc

# return with procs exits the calling method

# Group 2
my_proc = proc { return }

def check_return_with_proc_2(my_proc)
  my_proc.call
end

check_return_with_proc_2(my_proc)

# not sure what happens here, gives a LoclJumpError: unexpected return. 
# Procs passed in as arguments
# are treated differently than procs defined within a method?

# Group 3
def check_return_with_lambda
  my_lambda = lambda { return }
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda

# lambdas, on the other hand, pass control back to the calling method when they
# return

# Group 4

my_lambda = lambda { return }
def check_return_with_lambda(my_lambda)
  my_lambda.call
  puts "This will be output to screen."
end

check_return_with_lambda(my_lambda)

# lambdas with return can be passed in as arguments and called without throwing the
# JumpError procs will.

# Group 5
def block_method_3
  yield
end

block_method_3 { return }

# returns in blocks generating a LocalJumpError: Unexpted Return like a procs
# # passed in will. K.

# Comparison: Procs with return when defined and called within a method will
# exit the calling method. Procs defined outside the method when calling return
# when generate an error. 
# Lambdas, whether defined insided or outside the method, will pass control back
# to the calling method when return is used. 
# implict blocks will throw a LocalJumpError when yielded to a methodand return is called

def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
[8,10,12,14,16,33].map(&base8_proc)

# Expected: new Enumerator that iterates over an infinite list of factorials. 
# Test by printing first 7 factorials, starting with 0! Print twice, first using
# an external iterator and then "reset the iterator" and reprint the seven.

factorials = Enumerator.new do |collection|
  a, b = 1, 1
  loop do
    collection << a
    a, b = (1..b).inject(:*), b + 1
  end
end

7.times {p factorials.next }
factorials.rewind 

p factorials.take(7)

factorials.each_with_index do |x, i|
  p x
  break if i == 6
end

# Bubble Sort with Blocks

def bubble_sort!(arr)
  i = 0
  new_arr = []
  
  loop do
    if block_given?
      if !yield(arr[i], arr[i+1])
        arr[i], arr[i + 1] = arr[i+1], arr[i]
        i += 1
      else
        i += 1
      end
    else
      if arr[i] > arr[i+1]
        arr[i], arr[i + 1] = arr[i+1], arr[i]
        i += 1
      else
        i += 1
      end
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