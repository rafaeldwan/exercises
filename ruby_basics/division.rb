def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

numerator = nil ; denominator = nil

puts "CHECK THIS OUT. I CAN DIVIDE TWO NUMBERS SUPER FAST."
loop do 
    puts "NUMBER THE FIRST, WHICH I SHALL DIVIDE BY THE SECOND"
    numerator = gets.chomp
    break if valid_number?(numerator)
    puts "I AM NOT DUM. THAT IS NO NUMBER. YOU MUST AGAIN."
end
loop do
    puts "THE SECOND NUMBER, WHICH I WILL DIVIDE THE FIRST BY SUPER FAST, NOW"
    denominator = gets.chomp
    break if valid_number?(denominator)
    puts "I AM NOT DUM. THAT IS NO NUMBER. OR IT'S NOT AN INTEGER, WHICH IS TOTALLY BEYOND ME AT THE MOMENT. THAT IS NO NUMBER. YOU MUST AGAIN."
end
puts numerator.to_f / denominator.to_f
puts "FASTER THAN YOU CAN POSSIBLY PROCESS, MEATSACK"