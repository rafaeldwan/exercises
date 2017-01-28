puts "REPEAT HOW MANY TIME?"
while true
    repeat = gets.chomp.to_i
    if repeat < 3
        puts "BORING. MORE. MORE!"
        next
    end
    break
end
repeat.times {puts "Launch School is the best!"}