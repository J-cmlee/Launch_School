# frozen_string_literal: true

def star(n)
  tips_width = (n - 1) / 2
  # print top half
  0.upto(tips_width - 1) do |i|
    left = Array.new(tips_width) { ' ' }
    left[i] = '*'
    right = Array.new(tips_width) { ' ' }
    right[-(i + 1)] = '*'
    puts left.join + '*' + right.join
  end
  # print middle
  puts '*' * n
  # print lower half
  0.upto(tips_width - 1) do |i|
    left = Array.new(tips_width) { ' ' }
    left[-(i + 1)] = '*'
    right = Array.new(tips_width) { ' ' }
    right[i] = '*'
    puts left.join + '*' + right.join
  end
end

star(11)

def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star2(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) { |distance| print_row(grid_size, distance) }
  puts '*' * grid_size
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end
