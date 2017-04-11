### 120 Object Oriented Programming > Easy 2


### Fix the Program - Mailable



### Complete The Program - Houses

# class House
#   attr_reader :price
#   include Comparable

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other)
#     price <=> other.price
#   end
# end


# ### Reverse Engineering

# class Transform
#   def initialize(string)
#     @string = string
#   end
  
#   def uppercase
#     @string.upcase
#   end
  
#   def self.lowercase(string)
#     string.downcase
#   end
# end

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')


# ### Comparing Wallets

# class Wallet
#   include Comparable

#   def initialize(amount)
#     @amount = amount
#   end

#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end
  
#   protected
  
#   attr_reader :amount
  
# end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end


### Pet Shelter

# Given: Following Code and output
# Expected: Classes and methods to make the code work

# 3 classes = Pet, Owner, Shelter

# Pet methods: 
#   initialize(species, name)
# Owner methods: 
#   initialize(name)
#     @adopted_pets = []
#   attr_reader :name :adopted_pets
#   number_of_pets
#     @adopted_pets.size
# Shelter methods:
#   attr_reader :adoptions
#   initialize, 
#   adopt(cat, owner) 
#     @adoptions[owner] << cat
#   print_adoptions
#   owner.each p pet.each

class Pet
  attr_reader :species, :name
  
  
  def initialize(species, name, *shelter)
    @species = species
    @name = name
    shelter.unloved << [@name, @species] if shelter
  end
end

class Owner
  attr_reader :name
  attr_accessor :adopted_pets
  
  def initialize(name)
    @name = name
    @adopted_pets = []
  end
  
  def number_of_pets
    adopted_pets.size
  end
end

# Shelter methods:
#   attr_reader :adoptions
#   initialize, 
#   adopt(cat, owner) 
#     @adoptions[owner] << cat
#   print_adoptions
#   owner.each p pet.each

class Shelter
  
  attr_writer :unloved
  
  def initialize
    @owners = []
    @unloved = []
  end
  
  def adopt(owner, pet)
    owner.adopted_pets << pet
    @owners << owner
    @owners.uniq!
    @unloved.delete([pet.name, pet.species])
  end
  
  def print_adoptions
    @owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.adopted_pets.each do |pet|
        puts "a #{pet.species} named #{pet.name}"
      end
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.


### Fix the Program - Expander

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander


### Moving

module Moveable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  attr_reader :name
  
  include Moveable
  
  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name
  
  include Moveable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name
  
  include Moveable

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

# You need to modify the code so that this works:

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"


### Nobility

class Noble
  attr_reader :name, :title
  
  include Moveable

  def initialize(name, title)
    @name = name
    @title = title
  end
  
  def walk
    "#{@title} " + super
  end
  
  private

  def gait
    "runs"
  end
end

