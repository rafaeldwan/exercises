require 'pry'

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

loop do
    puts "Ok, check this out. I need a positive or negative integer REAL. BAD."
    num1 = gets.chomp
    unless valid_number?(num1)
        puts "C'MON dude, help me out. Let's start again." 
        next
    end
    
    puts "WOW. Nice. THAT was... nice. I know I'm asking a lot, but now I need another integer. But, check this, it needs to be the OPPOSITE TYPE from the last one.
    \So if the last was positive, now I need negative. And vice-versa. Savvy?"
    num2 = gets.chomp
    unless valid_number?(num2)
        puts "C'MON dude, help me out. Let's start again." 
        next
    end
    #binding.pry
    num1 = num1.to_i
    num2 = num2.to_i
    
    if num1 >= 0 && num2 >= 0
    #book solution: if num1 * num2 > 0
        puts "THIS IS NOT TOUGH. One positive. One negative. Please. Let's try again."
        next
    elsif num1 <= 0 && num2 <= 0
        puts "THIS IS NOT TOUGH. One positive. One negative. Please. Let's try again."
        next
    end
    puts "#{num1} + #{num2} = #{num1 + num2}"   
    break
end
puts "Thank you fam."