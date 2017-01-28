while true
    puts "REPEAT HOW MANY TIME? \nUNLESS \"Q\", I RUN AWAY FOR \"Q\", I AM QPHOBE."
    repeat = gets.chomp
    break if repeat.upcase == "Q"
    if repeat.to_i < 3
        puts "BORING. MORE. MORE!"
        next
    end
    repeat.to_i.times {puts "Launch School is the best!"}
    puts "HA. HAHAHA. FUN. FUN! AGAIN!"
end
