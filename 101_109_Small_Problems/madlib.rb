words = File.readlines("words.txt").map(& :chomp).join(" ").split("SPLIT")
adj = words[0].split
noun = words[1].split
verb = words[2].split
adv = words[3].split

madlib = File.readlines("madly.txt").map(& :chomp).join(" ").split
so_mad = madlib.map do |word| 
  case word
  when "ADJ" then adj.sample
  when "NOUN" then noun.sample
  when "VRB" then verb.sample
  when "ADV" then adv.sample
  else
    word
  end
end

puts so_mad.join(" ")

  
    
