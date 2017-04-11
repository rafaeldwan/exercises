### 120 Object Oriented Programming > Basics: Classes and Objects 1

# Find the Class

puts 'Hello'.class
puts 5.class
puts [1, 2, 3].class


# Create the Class

class Cat
  
end


# Create the Object

kitty = Cat.new


# What are you? 

class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = cat.new


# Hello, Sophie!

class Cat
  def initialize(name)
    @name = name
    puts "Hello! My name is #{@name}!"
  end
end

sophie = Cat.new("Sophie")


# Hello, Sophie! (Part 2)

class Cat
  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello! My name is #{@name}!"
  end
end

sophie = Cat.new("Sophie")
sophie.greet


# Reader

class Cat
  attr_reader :name
  
  def initialize(name)
    @name = name
  end
  
  # def name
  #   @name
  # end
  
  def greet
    puts "Hello! My name is #{name}!"
  end
end

sophie = Cat.new("Sophie")
sophie.greet


# Writer

class Cat
  attr_reader :name
  attr_writer :name
  
  def initialize(name)
    @name = name
  end
  
  # def name=(name)
  #   @name = name
  # end
  
  def greet
    puts "Hello! My name is #{name}!"
  end
end

sophie = Cat.new("Sophie")
sophie.greet
sophie.name = "Luna"
sophie.greet

# Accessor

class Cat
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  # def name=(name)
  #   @name = name
  # end
  
  def greet
    puts "Hello! My name is #{name}!"
  end
end

sophie = Cat.new("Sophie")
sophie.greet
sophie.name = "Luna"
sophie.greet


# Walk the Cat

module Walkable
  def walk
    puts "Let's go for a walk, bruh!"
  end
end

class Cat
  include Walkable
  
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end
  
  # def name=(name)
  #   @name = name
  # end
  
  def greet
    puts "Hello! My name is #{name}!"
  end
end

sophie = Cat.new("Sophie")
sophie.walk