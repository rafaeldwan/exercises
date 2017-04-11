### 120 Object Oriented Programming > Basics: Inheritance


# Inherited Year
# Start the Engine (Part 1)
# Only Pass the Year

class Vehicle
  attr_reader :year
  
  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type
  
  def initialize(year, bed_type)
    super(year)
    start_engine
    @bed_type = bed_type
  end
  
  def start_engine
    puts 'Ready to go!'
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type

car1 = Car.new(2006)
puts car1.year


# Start the Engine (Part 2)
# Towable (Part 1)
# Towable (Part 2)

module Towable
  def tow
    puts "I can tow a trailer! Vrroooooom!"
  end
end

class Vehicle
  attr_reader :year
  
  def initialize(year)
    @year = year
  end
end
  
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  include Towable
  def start_engine(speed)
    super() + " Drive #{speed} please!"
  end
end



class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year
puts truck1.tow

car1 = Car.new(2006)
puts car1.year


# Method Lookup (Part 1)

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color


# Method Lookup (Part 2)

class Animal
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new
cat1.color

# Method Lookup (Part 3)

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color


# Transportation

module Transportation
  class Vehicle
  end
  
  class Truck < Vehicle
  end
  
  class Car < Vehicle
  end
end

# my fave from memory

module Transportation
  Vehicle = Class.new
  Truck = Class.new(Vehicle)
  Card = Class.new(Vehicle)
end