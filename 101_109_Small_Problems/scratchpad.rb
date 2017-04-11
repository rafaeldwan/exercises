def transpose(matrix)
  result = []
  (0..2).each do |column_idx|
    new_row = (0..2).map { |row_idx| matrix[row_idx][column_idx] }
    result.push new_row
  end
  result
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)
p new_matrix
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

def find_dup(arr)
  arr.select { |i| arr.count(i) == 2 }[0]
end

[1, 2, "this", "that", 3, "this", "those"]

def do_it
  puts  <<~HEREDOC
  Blah Blah Blah
  Blah
  Blah
  Blah blah
  HEREDOC
end

do_it



def reverse!(list)
  arr = list.each_with_object([]).with_index {|(x, arr), i| arr << [i, x]}.sort{|a,b| b<=>a}
  (0...(list.size)).each {|i| list[i] = arr[i][1]} 
  list
end

def reverse!(list)
  list = list.map!.with_index {|x, i| [i,x]}.sort!{ |a, b| b <=> a }.map! {|i| i[1]} 
end

def reverse!(list)
  list = list.sort! { |a, b| list.index(b) <=> list.index(a) }
end

list = [4,1,2,3,4]
result = reverse!(list) # => [4,3,2,1,4]
list == [4, 3, 2, 1, 4]
list.object_id == result.object_id

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
list == ["abc"]

list = []
reverse!([]) # => []
list == []