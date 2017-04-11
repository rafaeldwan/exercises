def circle(radius)
  # Use the fact that radius**2 == x**2 + y**2 
  # to determine the coordinates on a quarter segment of the circle
  coordinates = (0..radius).map { |x| [x, Math.sqrt(radius**2 - x**2)] }
  binding.irb
  # Map coordinates to a string
  quarter = coordinates.map { |_, y| ' ' * y + '*' }
  binding.irb
  # Hack to get a height that looks approximately correct in my terminal
  quarter = quarter[(quarter.size / 2)..-1]
  binding.irb
  # Assemble the quarter to a half, and the halves to a full cirlce
  half = quarter.map { |line| (line.reverse + line).center(2 * radius + 2) }
  binding.irb
  circle = half.reverse + half
  circle
end

11*4 + 10* 16 + (9.downto(1).sum)*4