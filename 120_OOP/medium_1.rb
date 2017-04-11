require 'irb'

### 120 Object Oriented Programming > Medium 1

### Privacy

# class Machine
  
#   def start
#     flip_switch(:on)
#   end
  
#   def stop
#     flip_switch(:off)
#   end
  
#   def status
#     "Machine is #{switch}"
#   end
  
#   private
  
#   attr_accessor :switch
  
#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end

# sprocket = Machine.new
# p sprocket.start
# p sprocket.stop
# p sprocket.status


### Fixed Array

# Given: code for a FixedArray class
# Expected: true on all tests, needs [], []=, to_a(?), to_s(?), negative wrapping on []))


# class FixedArray
  
#   def initialize(size)
#     @array = []
#     size.times { @array << nil }
#   end
  
#   def [](i)
#     @array.fetch(i)
#   end
  
#   def []=(i, x)
#     @array.fetch(i) # to raise index error
#     @array[i] = x
#   end
  
#   def to_a
#     @array.clone # to make sure a new object is cloned in case this method is used for assignment
#   end
  
#   def to_s
#     @array.to_s
#   end
# end

# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5

# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'

# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end

# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

# # binding.irb


# ### Students

# # Given: unfinished code
# # Expected: class with asked for abilities 
# # Rule: no more than 5 lines o code

# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end

# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end

# class Undergraduate < Student
#   def initialize(name, year)
#     super
#   end
# end


### Circular Queue

# Expected: class that is a circular que - limited space - 
#   two methods
#     enqueue = adds to queue
#       if queue is full removes oldest
#     dequeue = removes oldest, return nil if empty
    
#   so we'll set an ivar that checks size
#   initialize an empty array
#   just do a check for empty in dequeue
#   call dequeue with a conditional if size = size
#   do it with unshift and pop


# class CircularQueue
#   def initialize(buffer_size)
#     @buffer_size = buffer_size
#     @circle = []
#   end
  
#   def enqueue(object)
#     dequeue if @circle.size == @buffer_size
#     @circle.unshift(object)
#   end
  
#   def dequeue
#     @circle.empty? ? nil : @circle.pop
#   end
# end
    
# queue = CircularQueue.new(3)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

# queue = CircularQueue.new(4)
# puts queue.dequeue == nil

# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1

# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2

# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil


### Stack Machine Interpretation

class Minilang
  COMMANDS = %w(n print push add div mult mod sub pop)
  
  def initialize(string)
    @register = 0
    @stack = []
    @int = nil
    @string = string.downcase.split
  end
  
  def invalid_input(command)
    p "->>SORRY, NO COMPRENDO \"#{command}\"." 
  end
  
  def stackerror(command)
    p "->>CAN'T DO #{command.upcase} BUDDY, STACK IS EMPTY"
  end
  
  def eval
    @string.each do |command|
      @int, command = command.to_i, 'n' if command.to_i.to_s == command
      return invalid_input(command) unless COMMANDS.include?(command)
      
      unless COMMANDS[0..2].include?(command)
        return stackerror(command) if @stack.empty?
      end
      
      case command
      when 'n' then @register = @int
      when 'push' then @stack << @register
      when 'add' then @register += @stack.pop
      when 'sub' then @register -= @stack.pop
      when 'mult' then @register *= @stack.pop
      when 'div' then @register /= @stack.pop
      when 'mod' then @register %= @stack.pop
      when 'pop' then  @register = @stack.pop
      when 'print' then p @register
      end
    end
    
    return nil
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)


### Number Guesser Part 1

# Expected: Object-oriented guess game for numbers in range 1..100 with max number
# guesses each game

# Player guesses a number from 1..100. Game displays outcome: if correct or if higher/lower


# Player
#   guesses
#   has a number of guesses
#   wins or loses
# PingGame
#   chooses number
#   displays outcome
#  
# Number
#   has a value
#   just gonna be an ivar
# end

# module NumRange
#   NUM_RANGE = (1..100)
# end

# class Player
#   include NumRange
  
#   INITIAL_GUESSES = 7
 
#   attr_accessor :guesses
  
#   def initialize
#     @guesses = INITIAL_GUESSES
#   end
  
#   def guess
#     num = "NOTHING HERE YET"
#     prompts = ["Watcha think it is? ", "GUESS TIME: ", "Pick a number: ",
#               "I don't think you're gonna get it: ", "Hit me with an int: "]
#     loop do 
#       puts "The answer is between #{NUM_RANGE.max} and #{NUM_RANGE.min}."
#       print prompts.sample
#       num = gets.chomp
#       break if validate(num)
#       print "That won't work! "
#     end
#     num.to_i
#   end
  
#   private
  
#   def validate(num)
#     NUM_RANGE.cover?(num.to_i)
#   end
  
# end


# class PingGame
#   include NumRange
  
#   def initialize
#     @number = rand(NUM_RANGE)
#     @player = Player.new
#   end
  
#   def play
#     # display_welcome_message
    
#     loop do
#       display_remaining_guesses
#       break if @player.guesses == 0
#       player_turn
#       check_guess
#       display_result
#       break if @result == :correct
#     end
#     reset
#   end
  
#   private
  
#   def reset
#     initialize
#   end
  
#   def display_remaining_guesses
#     if @player.guesses == 0
#       puts "No more guesses! You failed!"
#     else
#       puts "You have #{@player.guesses} remaining."
#     end
#   end
  
#   def player_turn
#     @guess = @player.guess
#     @player.guesses -= 1
#   end
  
#   def check_guess
#     @result = case @guess <=> @number
#               when 1 then :high
#               when -1 then :low
#               when 0 then :correct
#               end
#   end
  
#   def display_result
#     case @result
#     when :high then puts "Too high!"
#     when :low then puts "Too low!"
#     when :correct then puts "OH WOW! That's correct! You must be some kinda psychic!"
#     end
#   end
# end

# game = PingGame.new
# game.play
# game.play


### Number Guesser Part 2

# module ShareVar
#   def set
#     @shared_var = gets.chomp
#   end
# end

# class SetVar
#   include ShareVar
  
#   def initialize
#     set
#   end
# end  

# class DisplayVar
#   include ShareVar
  
#   def initialize
#     p @shared_var
#   end
# end

# SetVar.new
# DisplayVar.new


class Player
  attr_accessor :guesses

  def initialize(range)
    @range = range
    @guesses = allowed_guesses
  end

  def guess
    num = "NOTHING HERE YET"
    prompts = ["Watcha think it is? ", "GUESS TIME: ", "Pick a number: ",
              "I don't think you're gonna get it: ", "Hit me with an int: "]
    loop do 
      puts "The answer is between #{@range.min} and #{@range.max}."
      print prompts.sample
      num = gets.chomp
      break if validate(num)
      print "That won't work! "
    end
    num.to_i
  end

  private

  def validate(num)
    @range.cover?(num.to_i) && num =~ /^-{0,1}\d+$/
  end

  def allowed_guesses
    Math.log2(@range.size).to_i + 1
  end
end


class PingGame
  def play
    reset
    loop do
      display_remaining_guesses
      break if @player.guesses == 0
      player_turn
      check_guess
      display_result
      break if @result == :correct
    end
  end

  private

  def set_range
    loop do 
      print "Pick the first number:"
      num1 = gets.chomp
      if validate(num1)
        @num1 = num1
        break
      end

      puts "Can't do that."
    end

    loop do 
      print "Pick the second number:"
      @num2 = gets.chomp
      break if validate(@num2)
      puts "Nope, try again."
    end

    nums = [@num1.to_i, @num2.to_i]
    @range = (nums.min..nums.max)
  end

  def validate(num)
    if @num1
      num =~ /^-{0,1}\d+$/ && num != @num1
    else
      num  =~ /^-{0,1}\d+$/
    end
  end

  def reset
    @num_range = set_range
    @number = rand(@num_range)
    @player = Player.new(@num_range)
  end

  def display_remaining_guesses
    if @player.guesses == 0
      puts "No more guesses! You failed!"
    else
      puts "You have #{@player.guesses} remaining."
    end
  end

  def player_turn
    @guess = @player.guess
    @player.guesses -= 1
  end

  def check_guess
    @result = case @guess <=> @number
              when 1 then :high
              when -1 then :low
              when 0 then :correct
              end
  end

  def display_result
    case @result
    when :high then puts "Too high!"
    when :low then puts "Too low!"
    when :correct then puts "OH WOW! That's correct! You must be some kinda psychic!"
    end
  end
end

# game = PingGame.new
# game.play
# game.play


### Highest and Lowest Ranking Cards


# Expected: method return highest ranking card in an array, method
#           returning lowest of the same. To_s method that converts cards to
#           appropriate strings. 
          
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

# further exploration:

# class Card
#   include Comparable
#   attr_reader :rank, :suit
  
#   FACE_VALUE = { Jack: 11, Queen: 12, King: 13, Ace: 14 }
#   SUIT_VALUE = { Diamonds: 1, Clubs: 2, Hearts: 3, Spades: 4}
  
#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end
  
#   def worth
#     return @rank if @rank.is_a?(Integer)
#     FACE_VALUE[@rank.intern]
#   end
  
#   def <=>(other)
#     if worth == worth
#       SUIT_VALUE.fetch(self.suit.intern) <=> SUIT_VALUE.fetch(other.suit.intern)
#     else
#       worth <=> other.worth
#     end
#   end
  
#   def to_s
#     "#{@rank} of #{@suit}"
#   end
# end

# cards = [Card.new(2, 'Hearts'),
#         Card.new(10, 'Diamonds'),
#         Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#         Card.new(4, 'Diamonds'),
#         Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#         Card.new('Jack', 'Diamonds'),
#         Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#         Card.new(8, 'Clubs'),
#         Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8
# binding.irb


### Deck of Cards

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

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
p 52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.


### Poker!

# see file poker.rb