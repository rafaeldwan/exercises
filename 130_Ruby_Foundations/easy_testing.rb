### 130 Ruby Foundations: More Topics > Easy Testing

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!


# Boolean Assertions

def test_value_odd_q
  assert_equal(value.odd?, true)
end

# LS 
assert value.odd?, "Value is not odd"


# Equality Assertions

assert_equal('xyz', value.downcase)


# Nil Assertions

assert_nil value


# Empty Object Assertions

assert_empty list


# Included Object Assertions

assert_includes list, 'xyz'


# Exception Assertions

assert_raises NoExperienceError do
  employee.hire
end

# Type Assertions

assert_instance_of Numeric, value


# Kind Assertions

assert_kind_of Numeric, value


# Same Object Assertions

assert_same list, list.process


# Refutations

refute_inlcudes list, 'xyz'


