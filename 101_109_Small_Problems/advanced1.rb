require 'pry'

words = File.readlines("words.txt").map(& :chomp).join(" ").split("SPLIT")
adj = words[0].split
noun = words[1].split
verb = words[2].split
adv = words[3].split

p adj.sample
p noun.sample
p verb.sample
p adv.sample

madlib = File.readlines("madly.txt").map(& :chomp).join(" ").split
so_mad = madlib.map do |word| 
  case word
  when "ADJ" then adj.sample
  when "NOUN" then noun.sample
  when "VRB" then verb.sample
  when "ADV" then adv.sample
  else
    word
  end
end

puts so_mad.join(" ")

  
# Seeing Stars  
  
  
# the top line has (int - 3) / 2 spaces between stars, that will be a constant
# iterate from that down to zero to create an array of lines
# loop through centered printing generated array in both directions, full line between the 
# two loops. 

def print_lines_forward(lines, int)
  lines.each { |line| puts line.center(int) }
end

def print_lines_backward(lines, int)
  lines.reverse_each { |line| puts line.center(int) }
end
  
def star(int)
  spacing = (int - 3).div(2)
  lines = spacing.downto(0).map do |spaces|
    "*#{' ' * spaces}*#{' ' * spaces}*"
  end
  print_lines_forward(lines, int)
  puts "*" * int
  print_lines_backward(lines, int)
end

  #       *  *              *  * 2
  #   *        *        *        * 8
  #   *          *      *          * 10
  #   *          *      *          *
  #   *        *        *        *
  #       *  *              *  *
        
  #       *  *
  #   *        *
  #   *          *
  # *            *
  # *              *
  # *              *
  # *            *
  #   *          *
  #   *        *
  #     *      *
  #       *  *
        
  #       *  *
  #     *    *
  #     *    *
  #       *  *
        
  #       * *
  #     *   *
  #     *     *
  #     *     *
  #     *     *
  #     *   *
  #       * *
def circle(int)
  return "Even only SORRY" if int.odd?
  
  lines = (2..(int-2)).step(2).map { |spaces| "*#{' ' * spaces}*" }
  print_lines_forward(lines, int)
  print_lines_backward(lines, int)
    
end

def sinewave(int)
  firstspace = 1
  midspaces = int.downto(1).map { |i| 1 + (2 * (i - 1)) }
  first = 0
  second = -1
  int.times do
    print "*#{" " * midspaces[first]}"  #first line
  end
  puts
  first += 1
  (int-1).times do
    
    print "#{" " * firstspace}*"
    (int-1).times do
      print "#{' ' * midspaces[first]}*#{' ' * midspaces[second]}*"
    end
    puts
    second -= 1
    first += 1
    firstspace += 1
  end
  print " " * firstspace
  (int).times do
    print "*#{" " * midspaces[second]}"  #first line
  end
end



def word_cap(sentence)
  hsh = {}
  keys = []
  values = []
  ("a".."z").each { |alph| keys << alph }
  ("A".."Z").each { |alph| values << alph }
  keys.each_with_index { |alph, idx| hsh[alph] = values[idx] }
  result = sentence.split.each do |words|
    keys.include?(words[0]) ? words[0] = hsh[words[0]] : words[0]
  end
  
  counter = 0
  loop do
    p result
    current_word = result[counter]
    inner_counter = 0
    current_letter = ""
    loop do
      # binding.pry
      current_letter = current_word[inner_counter]
      if hsh.has_value?(current_letter)
        value_index = values.find_index(current_letter)
        lowercase = keys[value_index]
        current_word[inner_counter] = lowercase
        inner_counter += 1
      else
        inner_counter += 1
      end
      # binding.pry
      break if inner_counter == current_word.length - 1
    end
    counter += 1
    break if counter == result.size
  end
  result.join(' ')
end

# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap("to is at")
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


# Transpose 3 x 3

# Given: 3x3 Matrix in array of arrays format
# Return: transposed matrix. do not transform original

# [[0,1,2], 
# [3,4,5],
# [6,7,8]]

# [[0,3,6]
# [1,4,7]
# [2,5,8]]

# so we'll create new array of arrays
# go through each, then each item, push


def transpose(matrix)
  result = [
          [], 
          [], 
          []
  ]
            
  matrix.each do |array|
    i = 0
    array.each do |element|
      result[i].push element
      i += 1
    end
  end
  result  
end

# ls solution more or less from memory
def transpose(matrix)
  result = []
  (0..2).each do |column_idx|
    new_row = (0..2).map { |row_idx| matrix[row_idx][column_idx] }
    result.push new_row
  end
  result
end

def transpose!(matrix)
  matrix.replace( [
                  [matrix[0][0], matrix[1][0], matrix[2][0]],
                  [matrix[0][1], matrix[1][1], matrix[2][1]],
                  [matrix[0][2], matrix[1][2], matrix[2][2]]
  ])           
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

def transpose(matrix)
  result = []
  (0...(matrix[0].size)).each do |column_idx|
    new_row = (0...(matrix.size)).map { |row_idx| matrix[row_idx][column_idx] }
    result.push new_row
  end
  result
end

def transpose(matrix)
  result = matrix[0].map { [] }
  
  matrix.each do |array|
    array.each_with_index do |element, i|
      result[i].push element
    end
  end
  result  
end

# nick johnson's solution from memory

def transpose(matrix)
  matrix[0].zip(matrix*.drop(1))
end


# Rotating Matrices

def rotate90(matrix)
  result = []
  matrix[0].size.times do |row_idx|
    new_row = []
    matrix.size.times do |column_idx|
      new_row.unshift(matrix[column_idx][row_idx])
      # ls solution mapped directly then called reverse on the row
    end
    result.push new_row
  end
  result
end

[[1,2,3],     
 [4,5,6],
 [7,8,9]]
 
 [[7, 4, 1],
  [8, 5, 2],
  [9, 6, 3]]
  
  [[1, 2],
   [3, 4],
   [5, 6]]
   
   [[5, 3, 1],
    [6, 4, 2]]
    
matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2


def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])