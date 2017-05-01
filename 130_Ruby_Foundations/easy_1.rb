### 130 Ruby Foundations: More Topics > Easy 1


# Enumerable Class Creation

class Tree
  include Enumerable
  
  def each
    
  end
end

def compute(&block)
  if block 
    block.call
  else
    "Does not compute"
  end
end


# Find Missing Numbers

def missing(int_arr)
  comparison_arr = ((int_arr.min)..(int_arr.max))
  comparison_arr.reject { |int| int_arr.include?(int) }
end

# further:

def missing(int_arr)
  (int_arr.min..int_arr.max).to_a - int_arr
end

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

def missing((first, *nums, last))
  [*first.to_i.next...last.to_i] - nums
  binding.irb
end


def missing(ary)
  (ary.min..ary.max) - ary
end


# Divisors

def divisors(int)
  (1..int).select { |num| int % num == 0 }
end


#  Encrypted Pioneers

ALPHA = ("a".."z").to_a
ROT13 = ALPHA.rotate(13)
ALPHACAPS = ("A".."Z").to_a
ROTCAPS = ALPHACAPS.rotate(13)

def decrypt(string)
  real_name = string.chars.map do |char|
    if !("A".."z").cover?(char)
      char
    elsif char.upcase == char 
      ALPHACAPS[ROTCAPS.index(char)]
    else
      ALPHA[ROT13.index(char)]
    end
  end.join
end

encrypted_names = "Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unyog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Wbua Ngnanfbss
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu"

#  encrypted_names.split("\n").each { |name| puts decrypt(name) }


# Iterators: True for Any?

# expected: method that takes an array and a block and returns true as soon as one
# the block evaluates to true for an element. Otherwise it returns false.

# rules: no all?, any? none? or one?

# For loop with return true

def any?(arr)
  for el in arr 
    return true if yield(el) 
  end
  false
end

any?([1, 3, 5, 6]) { |value| value.even? } == true
any?([1, 3, 5, 7]) { |value| value.even? } == false
any?([2, 4, 6, 8]) { |value| value.odd? } == false
any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
any?([1, 3, 5, 7]) { |value| true } == true
any?([1, 3, 5, 7]) { |value| false } == false
any?([]) { |value| true } == false


#  Iterators: True for All?

def all?(arr)
  for el in arr 
    return false unless yield(el) 
  end
  true
end

all?([1, 3, 5, 6]) { |value| value.odd? } == false
all?([1, 3, 5, 7]) { |value| value.odd? } == true
all?([2, 4, 6, 8]) { |value| value.even? } == true
all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
all?([1, 3, 5, 7]) { |value| true } == true
all?([1, 3, 5, 7]) { |value| false } == false
all?([]) { |value| false } == true


# Iterators: True for None?

def none?(arr, &block)
  !any?(arr, &block)
end

none?([1, 3, 5, 6]) { |value| value.even? } == false
none?([1, 3, 5, 7]) { |value| value.even? } == true
none?([2, 4, 6, 8]) { |value| value.odd? } == true
none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
none?([1, 3, 5, 7]) { |value| true } == false
none?([1, 3, 5, 7]) { |value| false } == true
none?([]) { |value| true } == true


# Iterators: True for One?

def one?(coll)
  trigger = 0
  for el in coll
    trigger += 1 if yield(el)
    return false if trigger > 1
  end
  trigger == 1
end


# Count Items

def count(coll)
  counter = 0
  for el in coll
    counter += 1 if yield(el)
  end
  counter
end

count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2