PASSWORD = "SECRET CODE"
while true
    puts "SECRET CODE OR I REPEAT MYSELF SEE IF I DON'T"
    attempt = gets.chomp
    break if attempt == PASSWORD
    puts "THAT IS NOT SECRET CODE. COMMENCING REPETITION."
end