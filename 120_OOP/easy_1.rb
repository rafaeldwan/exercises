### 120 Object Oriented Programming > Easy 1

require 'pry'

# Banner Class

# given = message
# return = message printed in a box

# rules - work empty, keep methods private, message will fit in terminal window

# message as ivar, top line + "-" * message length, sides | " " * message length |

class Banner
  def initialize(message, width = 0)
    @message = message
    @width = width
    @line_length = [(@message.length + 2), @width].max
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end
  
  private

  def horizontal_rule
    "+#{'-' * @line_length}+"
  end

  def empty_line
    "|#{' ' * @line_length}|"
  end

  def message_line
    spacing = (@line_length - @message.size) / 2
    "|#{' ' * spacing}#{@message}#{' ' * spacing}|"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 4)
puts banner

banner = Banner.new('')
puts banner

banner = Banner.new("Giggity", 55)
puts banner


# What's the output? 

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name


### Fix the Program - Books (Part 1)



class Book
  attr_reader :author, :title
  
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{@title}"", by #{@author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)


### Fix the Program - Books (Part 2)

class Book
  attr_accessor :title, :author

  
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)


### Fix the Program - Persons 

class Person
  
  attr_writer :first_name, :last_name
  def initialize(first_name, last_name)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
  end

  def to_s
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end

person = Person.new('john', 'doe')
puts person

person.first_name = 'jane'
person.last_name = 'smith'
puts person


### Buggy Code - Car Mileage

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678


# Rectangles and Squares

# given: class Rectangle
# needed: new Square class that only needs the one side length as param and inherits from Rectangle

# overwrite initialize

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(length)
    @height, @width = length, length
  end
end

# LS better solution from memory:

class Square < Rectangle
  def initialize(length)
    super(length, length)
  end
end

# Another solution I liked from memory

class Square < Rectangle
  def initialize(height, width=height)
    super
  end
end

# Yet another

class Square < Rectangle
  def initialize(length)
    @height = @width = length
  end
end



### Complete the Program - Cats


class Pet
  def initialize(name, age, marking)
    @name = name
    @age = age
    @marking = marking
  end
  
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@marking} fur."
  end
end

class Cat < Pet
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
# Update this code so that when you run it, you see the following output:

# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur


### Rafactoring Vehicles

class MotorVehicle
  attr_reader :make, :model
  
  def initialize(make, model)
    @make = make
    @model = model
  end
  
  
  def to_s
    "#{make} #{model}"
  end
end

class Car < MotorVehicle

  
  def wheels
    4
  end
end

class Motorcycle < MotorVehicle
  def wheels
    2
  end
  
  def to_s
    "#{make} #{model}"
  end
end

class Truck
  attr_reader :payload
  @make = make
  @model = model
  @payload = payload
  
  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
  
  def wheels
    6
  end
end


