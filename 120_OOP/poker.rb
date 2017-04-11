require 'irb'

class Card
  include Comparable
  attr_reader :rank, :suit
  
  FACE_VALUE = { Jack: 11, Queen: 12, King: 13, Ace: 14 }
  
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  def worth
    return @rank if @rank.is_a?(Integer)
    FACE_VALUE[@rank.intern]
  end
  
  # I love how LS did it: FACE_VALUE.fetch(@rank.intern, @rank)
  
  def <=>(other)
    worth <=> other.worth
  end
  
  def to_s
    "#{@rank} of #{@suit}"
  end
end

class Deck
  RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    new_deck
  end
  
  def draw
    new_deck if @deck.empty?
    card = @deck.pop
    Card.new(card[0], card[1])
  end
  
  def new_deck
    @deck = RANKS.product(SUITS).shuffle
  end
end

class PokerHand
  HAND_SIZE = 5
  attr_reader :ranks, :suits
  
  def initialize(deck)
    @cards = []
    @deck = deck
    HAND_SIZE.times { @cards << @deck.draw }
    @ranks = @cards.map { |card| card.worth }
    @suits = @cards.map { |card| card.suit }
  end

  def print
    @cards.each { |card| puts card }
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    straight_flush? &&  @cards.max == 14
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    card_check = @ranks.dup
    return false if @ranks.uniq.size > 2
    (HAND_SIZE - 3).times do
      card_one = card_check.pop
      checksum = 1
      card_check.each do |card|
        checksum += 1 if card_one == card
        return true if checksum == 4
      end
    end
    
    false
  end

  def full_house?
    @ranks.uniq.size == 2 && !four_of_a_kind?
  end

  def flush?
    @suits.uniq.size == 1
  end

  def straight?
    cards_by_number = @cards.sort
    checksum = 0
    i = 0
    (HAND_SIZE - 1).times do 
      checkup = checksum
      checkup += 1 if cards_by_number[i + 1] == cards_by_number[i] + 1
      checkup == checksum ? (return false) : (i += 1)
    end
  end

  def three_of_a_kind?
    card_check = @ranks.dup
    
    (HAND_SIZE - 1).times do
      card_one = card_check.pop
      checksum = 1
      card_check.each do |card|
        checksum += 1 if card_one == card
        return true if checksum == 3
      end
    end
    false
  end

  def two_pair?
    card_check = @ranks.dup
    checksum = 0
    (card_check.size - 1).times do
      card_one = card_check.pop
      card_check.each do |card|
        checksum += 1 if card_one == card
      end
      return true if checksum == 2
    end
    false
  end

  def pair?
    
    card_check = @ranks.dup
    
    (HAND_SIZE - 1).times do
      card_one = card_check.pop
      card_check.each do |card|
        return true if card_one == card
      end
    end
    
    false
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'
binding.irb