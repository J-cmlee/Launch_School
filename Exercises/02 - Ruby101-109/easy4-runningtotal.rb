# frozen_string_literal: true

def running_total(arr)
  sum = 0
  new_arr = []
  arr.each do |value|
    new_arr << sum + value
    sum += value
  end
  new_arr
end

def running_total2(arr)
  sum = 0
  arr.each_with_object([]) do |i, a|
    a << i + sum
    sum += i
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

p running_total2([2, 5, 13])
