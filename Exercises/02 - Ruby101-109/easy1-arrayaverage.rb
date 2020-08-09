
def average(number_array)
  sum = 0
  number_array.each {|num| sum += num}
  sum/(number_array.length)
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40