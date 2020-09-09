def diamond(n)
  counter = 1
  n.times do |index|
    empty_space = (n-counter) /2
    puts "#{" " * empty_space}" + "#{"*" * counter}"
    if index < (n/2)
      counter += 2
    else
      counter -= 2
    end
  end
end

diamond(9)

def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond2(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end

diamond2(11)