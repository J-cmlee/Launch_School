def sum_of_sums(array)
  return array[0] if array.length == 1

  total_sum = 0
  end_counter = 0
  while end_counter < array.length
    total_sum += array[0..end_counter].sum
    end_counter += 1
  end
  total_sum
end

def sum_of_sums2(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

p sum_of_sums([3, 5, 2]) == 3 + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == 1 + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
