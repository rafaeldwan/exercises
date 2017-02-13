### 101-109 Small Problems > Easy 2

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


# How old is Teddy?


age = Random.new
age_other_way = rand(20..200)

puts "Teddy is #{age.rand(20..200)} years old!"
puts "Teddy is #{age_other_way} years old!"


# How big is the room?


SQFEET_TO_METERS = 10.7639
SQFEET_TO_INCHES = 144
SQFEET_TO_CM = 929.03

prompt "I AM AMAZING ARCHITECT. GIVE ME LENGTH OF ROOM. IN FEET BECUS USA #1"
length = gets.to_f
prompt "ROGER WILCO. GIVE ME WIDTH NOW! IN FEET! FEET!"
width = gets.to_f

area = length * width

thinking

puts "OK IS GOT! ONLY BEST ARCHITECT WOULD KNOW THAT ROOM HAS #{area.round(2)} SQUARED FEETS BELIEVE ME"

thinking

puts "THAT'S #{(area * SQFEET_TO_INCHES).round(2)} SQUARED INCHES."

thinking

puts "IN EUROPE THEY WOULD SAY IT HAS #{area / SQFEET_TO_METERS} \
SQUARE METERS BECAUSE THEY HATE FREEDOM."

thinking

puts "DID YOU KNOW THAT IS #{(area * SQFEET_TO_CM).round(2)} SQUARED CENTIMETERS? \
JIMMINY JONES ARE YOU IMPRESSED YET? AM REAL ARCHITECT!"


###Tip calculator

prompt "HOW MUCH DO YOU OWE FOR THE SUSTINENCE, SERVICE, AND DISHWASHING?"
bill = gets.chomp
prompt "I HOPE IT WAS WORTH IT. WHAT PERCENTAGE WOULD YOU LIKE TO PAY TO MAKE UP \
FOR MINIMUM WAGE BEING SO LOW?"
tip_percent = gets.chomp

tip = (bill.to_f * ((tip_percent.to_f)/100))
total = tip + bill.to_f
#thinking
puts "THANKS TO THE LACK OF A FUNCTIONING LABOR MOVEMENT YOU WILL PAY $#{sprintf("%#.2f", tip)} EXTRA."
#thinking
puts "THAT BRINGS YOUR TOTAL EXPENDITURE TO #{sprintf("%#.2f", total)}"




### When will I Retire?

prompt "HOW MANY IS YOU OLD?"
age = gets.to_i

prompt "HOW MANY IS FOR YOU TOO OLD FOR COMPENSATED LABOR?"
retire_age = gets.to_i

until_retire = retire_age - age
current = Time.new.year
retire_year = current.to_i + until_retire

puts "NOW IS THE YEAR #{current}. WHEN YOU MAY CEASE YOUR LABOR IS #{retire_year}"
puts "YOU MAY LABOR FOR A REMAINING #{until_retire} YEAR(S)."


### Greeting a user

puts "I NEED NAME!"
name = ''
loop do
  name = gets.chomp
  if name.empty?()
    prompt "I AM NOT THE DUM 1 U R. VALID NAME. VALID!"
  else
    break
  end
end

filename = "names.txt"
File.open(filename, 'a') do |file|
  file.puts name
end

name.end_with?("!") ? (puts "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?") : (puts "Hello #{name}.")



### Odd Numbers


(1..99).each {|i| p i if i.odd?}

1.step(99, 2) {|i| p i}


### Even numbers


while true do
  i ||= 1
  p i if i.even?
  i+=1
  break if i >= 99
end


### Sum or Product of Consecutive Integers


prompt "NUMBER MORE THAN ZERO NOW. WILL BE ROUNDED UP"
number = ""
loop do
  number = gets.to_i
  break if number > 0
  prompt "NUMBER. MORE THAN ZERO. NOT TOUGH INSTRUCTION, R U DUM?"
end

prompt "I CAN [A]DD OR I CAN [M]ULTIPLICATION. IS IMPRESSIVE! YOU CHOOSE 'A' OR 'M'"
operation = ""
loop do
  operation = gets.chomp.upcase
  break if operation == "A" || operation == "M"
  prompt "R U DUM? IT IS EITHER 'A' OR 'M'. CHOOSE NOW!"
end

# shamelessly cribbed from http://stackoverflow.com/a/10556315
def fact(num)
  (1..num).reduce(:*) || 1
end

# but I adopted this from that all on my own :)
def sum(num)
  (1..num).reduce(:+) 
end

# Further exploration
def fact_inject(num)
  (1..num).inject {|product, i| product * i}
end

def sum_inject(num)
  (1..num).inject {|sum, i| sum + i}
end

operation == "A" ? answer = sum_inject(number) : answer = fact_inject(number)
operation == "M" ? did_it = ("MULTIPLICATING") : did_it = ("ADDLING")
thinking
puts "I KNOW THE ANSWER FOR #{did_it} THEM ALL TOGETHER BETWEEN 1 AND #{number} IT IS #{answer}"