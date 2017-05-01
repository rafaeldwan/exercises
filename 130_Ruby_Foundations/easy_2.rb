### 130 Ruby Foundations: More Topics > Easy 2


# Fromt-To-Step Sequence Generator

def step(first, last, step_value)
  value = first
  until value > last
    yield(value)
    value += step_value
  end
  nil
end

step(1, 10, 3) { |value| puts "value = #{value}" }


# Zipper

expected: method with takes two arrays of equal size and return a nested array
of two element arrays where the first in each is from the first array and the
second from the second in order. return the new array, originals should not be changed

def zip(arr1, arr2)
  if arr1.size >= arr2.size
    arr1.map.with_index { |el, i| [el, arr2.fetch(i, nil)] }
  else
    arr2.map.with_index { |el, i| [arr1.fetch(i, nil), el] }
  end
end

def zip(arr1, arr2)
  arr1.map.with_index { |el, i| [el, arr2.fetch(i, nil)] }
end

zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]


# map

def map(coll)
  coll.each_with_object([]) { |el, arr| arr << yield(el) }
end


# count

def count(*args)
  total = 0
  args.each { |arg| total += 1 if yield(arg) }
  total
end

count(1, 3, 6) { |value| value.odd? } == 2
count(1, 3, 6) { |value| value.even? } == 1
count(1, 3, 6) { |value| value > 6 } == 0
count(1, 3, 6) { |value| true } == 3
count() { |value| true } == 0
count(1, 3, 6) { |value| value - 6 } == 3


# drop_while

def drop_while(arr)
  return_arr = arr.dup
  arr.each { |el| yield(el) ? return_arr.shift : break }
  return_arr
end


drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| true } == []
drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
drop_while([]) { |value| true } == []


def each_with_index(arr)
  idx = -1
  arr.each { |el| yield(el, idx += 1) }
end


# each_with_object

def each_with_object(arr, object)
  arr.each { |el| yield(el, object) }
  object
end


# max_by

def max_by(arr)
  result = arr.each_with_object([]) {|el, result| result << yield(el)}
  arr[result.index(result.max)] rescue nil
end


# each_cons (Part 1)

def each_cons(arr, idx = 0)
  while idx < arr.size - 1 do
    yield(arr[idx], arr[idx + 1]) 
    idx += 1
  end
  nil
end


# each_cons (Part 2)

def each_cons(arr, chunk_size, idx = 0)
  while arr[idx + (chunk_size - 1)]
    calc_arr, working_idx = [], idx
    chunk_size.times do
      calc_arr << arr[working_idx]
      working_idx += 1
    end
    yield(*calc_arr)
    idx += 1
  end
  nil
end

def each_cons(arr, chunk_size, idx = 0)
  while arr[idx + (chunk_size - 1)]
    yield(*arr[idx, chunk_size])
    idx += 1
  end
  nil
end