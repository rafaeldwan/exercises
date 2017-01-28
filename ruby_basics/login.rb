USER = "JIMMY"
PASSWORD = "SECRET CODE"

while true
    puts "WHO ARE YOU"
    u_attempt = gets.chomp.upcase
    
    puts "SECRET CODE OR I REPEAT MYSELF SEE IF I DON'T"
    p_attempt = gets.chomp
    
    break if p_attempt == PASSWORD && u_attempt == USER
    puts "THAT IS NOT SECRET CODE. OR I DON'T LIKE YOUR NAME. EITHER WAY, COMMENCING REPETITION."
end
puts 'Hello, sailor'