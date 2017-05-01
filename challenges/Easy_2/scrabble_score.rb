class Scrabble
  
  LETTER_VALUES = { 1 => %w(A E I O U L N R S T),
                    2 => %w(D G),
                    3 => %w(B C M P),
                    4 => %w(F H V W Y),
                    5 => %w(K),
                    8 => %w(J X),
                    10 => %w(Q Z)
  }
  
  def initialize(word)
    @word = word.upcase rescue " "
  end
  
  def score
    return 0 if @word.match?(/[^A-Z]/)
    
    @word.chars.reduce(0) do |result, char| 
      result += LETTER_VALUES.find { |_, letters| letters.include?(char)}.first 
    end
  end
  
  def self.score(word)
    self.new(word).score
  end
end