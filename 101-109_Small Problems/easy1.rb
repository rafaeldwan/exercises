### 101-109 Small Problems > Easy 1

# Repeat Yourself

def repeat(string, int)
  int.times {p string}
end

repeat("Wowwee Zowee", 3)


# Odd


def is_odd?(int)
  int % 2 != 0
end

def is_odd_remainder?(int)
  int.remainder(2) != 0
end

puts is_odd?(2)
puts is_odd?(5)
puts is_odd?(-17)
puts is_odd?(-8)
puts "---"
puts is_odd_remainder?(2)
puts is_odd_remainder?(5)
puts is_odd_remainder?(-17)
puts is_odd_remainder?(-8)


# List of Digits

puts "***LIST OF DIGITS****"
def digit_list(int)
  int = int.to_s.split("")
  int.map { |i| i.to_i}
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]