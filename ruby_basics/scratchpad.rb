=begin
loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
  end
end

puts 'This is outside all loops.'


answer = "keep on keeping on"
while answer != 'yes'
      puts 'Should I stop looping?'
      answer = gets.chomp
      #error message helps ux
      puts "I will if you say yes, I promise." if answer.upcase != "YES" 
end



numbers = []

while numbers.length < 5
  numbers.push rand(100)
end
puts numbers



numbers = [7, 9, 13, 25, 18]
count = 0
until count == numbers.length
   puts numbers[count]
   count += 1
end



for i in 1..100 
  puts i if i.odd?
end


friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
   puts "What's up, #{friend}?" #changed from "x" to "friend" to follow best practice
end

# from ruby/file exercise 1 - having trouble working in irb.
require 'pathname'
f = File.new("simple_file.txt","r")
pn = Pathname.new(f)
puts pn.extname
puts File.extname("simple_file.txt")

count = 1

20.times do
   p " #{count} is even!" if count.even?
   p " #{count} is odd!" if count.odd?
   count += 1
end

loop do
  number = rand(100)
  puts number
   break if (1...10) === number
   #or break if number.between?(0, 10)
end

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  
  if answer == 4
     puts "You are extra smart!"
     break
  end
  
  puts "Holy crap did you fail 1st grade?"
end

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers.push input
  break if numbers.length == 5
end
puts numbers



names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
   if names != []
      name = names.pop
      puts name
   else
      break
   end
end

# they do
names = ['Sally', 'Joe', 'Lisa', 'Henry']
names[:last] = ['J', 'Joe', 'aLisa', 'OhHenry']
loop do
   puts names.shift
   break if names.empty?
end
   

5.times do |index|
   #index ||= 0 
   puts index
   break if index == 2
   #index += 1
end

# I guess x.times |index| automatically counts from 0 to x-1 in the |index|

number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end

number_a = 0
number_b = 0

loop do
  number_a += rand(2); puts number_a
  number_b += rand(2); puts number_b
  
  next if number_a != 5 && number_b != 5
  p "5 was reached!"
  break
end

def greeting
  puts 'Hello!'
end

number_of_greetings = 2
while number_of_greetings > 0
   number_of_greetings -= 1
   greeting
end



puts "I MUST KNOW HOW MANY YEARS YOU HAS"
age = gets.chomp.to_i
puts "YOU HAVE AT LEAST #{age * 12} MONTHS"


####methods


def hello
   "Hello"
end
def world
   "World"
end

def greeting
  hello + " " + world
end

puts greeting

def car(make, model)
   puts "#{make} #{model}"
end

car("Toyota", "Corolla")

daylight = [true, false].sample
def time_of_day(daytime)
   if daytime
      puts "It's daytime!"
   else
      puts "It's nighttime!"
   end
end

time_of_day(daylight)

def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Squee')}."

def assign_name (name="Bob")
   name
end

puts assign_name == 'Bob'
puts assign_name('Kevin') == 'Kevin'

def add(x, y)
   x + y
end

def multiply (x, y)
   x * y
end


puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(handle)
   handle.sample
end

def activity(verb)
   verb.sample
end

def sentence(name, verb)
   return "#{name} is #{verb} today!"
end

puts sentence(name(names), activity(activities))

def print_me
   p "I'm printing within the method!"
end

def print_return
   return "I'm printing the return value!"
end

print_me
puts print_return


####conditionals


sun = ['visible', 'hidden'].sample

puts "The sun is so bright!" if sun == "visible"
puts "The clouds are blocking the sun!" unless sun == "visible"

boolean = [true, false].sample
boolean ? puts("I'm true!") : puts("I'm false!")

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when "green" then puts "Go!"
when "yellow" then puts "Slow Down!"
when "red" then puts "Stop!"
end

stoplight = ['green', 'yellow', 'red'].sample

if stoplight == 'green'
  puts 'Go!'
elsif stoplight == 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end

status = ['awake', 'tired'].sample

result = if status == "awake"
   "Be productive!"
else 
   "Go to sleep!"
end

puts result

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green' then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else puts 'Stop!'
end



def test(b)
  b.map! {|letter| "I like the letter: #{letter}"}
end

a = ['a', 'b', 'c']
puts test(a)

def take_proc(proc)
  [1, 2, 3, 4, 5].each do |number|
    proc.call number
  end
end

proc = Proc.new do |number|
  puts "#{number}. Proc being called in the method!"
end

take_proc(proc)

=end


####strings


empty_string = String.new

name = 'Roger'
p name.upcase == 'RoGer'.upcase
p name.upcase == 'DAVE'.upcase

p name.casecmp('RoGer'.upcase) == 0
p name.casecmp('DAVE') == 0

first_name = 'John'
last_name = 'Doe'
full_name = "#{first_name} #{last_name}"
puts full_name

state = 'tExAs'
state.capitalize!
puts state

greeting = 'Hello!'
#greeting = "Goodbye!"
greeting.gsub!("Hello", "Goodbye")
puts greeting

alphabet = 'abcdefghijklmnopqrstuvwxyz'
puts alphabet.split("")

words = 'car human elephant airplane'
words.split(" ").each{|i| puts i + "s"}

colors = 'blue pink yellow orange'
puts colors.include?("yellow")
puts colors.include?("purple")


#arrays


pets = ['cat', 'dog', 'fish', 'lizard']
my_pet = pets[2]
puts "I have a pet #{my_pet}!"
my_pets = pets[2..3]
def pet_inventory(animals)
   if animals.length == 2 
      puts "I have a pet #{animals[0]} and a pet #{animals[1]}!"
   else
      puts "I have a pet #{animals[0]}!" #struggled with this for a second, which I think is the point. it's an array with only one thingy in it so I printed without the brackets, which printed as [fish]. still need to x[y] to get it to show as a normal string
   end
end
pet_inventory(my_pets)
my_pets.pop
pet_inventory(my_pets)
my_pets.push pets[1]
pet_inventory(my_pets)

colors = ['red', 'yellow', 'purple', 'green']
colors.each {|i| puts "I'm the color #{i}!"}

numbers = [1, 2, 3, 4, 5]
doubled_numbers = numbers.map {|i| i * 2}
p doubled_numbers

numbers = [5, 9, 21, 26, 39]
divisible_by_three = numbers.select {|i| i % 3 == 0}
p divisible_by_three


#### Hashes


#First car

car = {
   type: "sedan", 
   color: "blue", 
   mileage: 80000
}

#Adding the Year

car[:year] = 2003

#Broken Odomotor

car.delete(:mileage)

#What Color?

puts car[:color]

#Labeled Numbers

numbers = {
  high:   100,
  medium: 50,
  low:    10
}

numbers.each { |range, x| puts "A #{range} number is #{x}, duh."} 

#Divided by two

half_numbers = numbers.map { |range, x| x / 2}

p half_numbers

#Low, Medium, or High?

low_numbers = numbers.select {|range, x| x < 25 }

p low_numbers

#Low or nothing

low_numbers = numbers.select! do |key, value|
                 value < 25
               end
               
               #calling a destructive method when assigning a variable actually
               #creates an alias. both number and low_numbes now point to the 
               #same Hash

p low_numbers
p numbers

#multiple cars

automobiles = {
   Car: {
      type: "sedan",
      color: "blue",
      year: 2003
   },
   Truck: {
      type: "pickup",
      color: "red",
      year: 1998
   }
}

#which collection

car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}

carray = car.split
p carray