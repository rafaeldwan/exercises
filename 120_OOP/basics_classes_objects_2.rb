### 120 Object Oriented Programming > Basics: Classes and Objects 2


# Generic Greeting (Part 1)

class Cat
  def self.generic_greeting
    puts "Is good to be cat"
  end
end


# Hello, Chloe!

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def rename(name)
    initialize(name)
  end
end

kitty = Cat.new('Sophie')
kitty.name
kitty.rename('Chloe')
kitty.name


# Identify Yourself (Part 1)

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  
  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify


# Generic Greeting (Part 2)
# Counting Cats
# Colorful Cats
# Identify Yourself (Part 2)

class Cat
  COLOR = "purple"
  
  attr_reader :name
  
  @@total = 0 
  
  
  
  def initialize(name)
    @name = name
    @@total += 1
  end
  
  def self.generic_greeting
    puts "I AM A #{to_s.upcase} I SAY MEOW"
  end
  
  def personal_greeting
    p "GREETINGS. I AM KNOWN AS #{name.upcase} AND I AM A #{COLOR.upcase} #{self.class.to_s.upcase}"
  end
  
  def selfki.total
    puts "Total cats: #{@@total}."
  end
  
  def to_s
    "THE HUMANS HAVE NAMED ME #{name.upcase}."
  end
  
end

kitty0 = Cat.new("Bud")
kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting
Cat.total
puts kitty

### Public Secret

class Person
  attr_accessor :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
puts person1.secret


### Private Secret
### Protected Secret

class Person
  attr_writer :secret
  
  
  def share_secret
    puts secret
  end
  
  def compare_secret(person2)
    secret == person2.secret
  end
  
  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'
person1.share_secret
puts person1.compare_secret(person2)

