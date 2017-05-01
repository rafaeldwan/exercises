class Phrase
  def initialize(phrase)
    @words = phrase.downcase.scan(/[a-z]+'?[a-z]+|\d+/)
  end
  
  def word_count
    @words.each_with_object(Hash.new(0)) do |word, counted_words|
      counted_words[word] += 1
    end
  end
end

# phrase = Phrase.new('one,two,three')
# p phrase.word_count

# phrase = Phrase.new("Joe can't tell between 'large' and large.")
# p phrase.word_count
# phrase = Phrase.new('one,two,three')
# # phrase = Phrase.new("one,\ntwo,\nthree")
# p phrase.word_count

# phrase = Phrase.new("one,\ntwo,\nthree")
# p phrase.word_count