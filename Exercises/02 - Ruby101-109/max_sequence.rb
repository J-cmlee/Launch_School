def max_sequence(array)
  max_sum = 0
  current_sum = 0

  array.each do |value|
    current_sum += value
    current_sum = 0 if current_sum < 0
    max_sum = current_sum if current_sum > max_sum
  end

  max_sum
end

p max_sequence([])
p max_sequence([-2,1,-3,4,-1,2,1,-5,4])