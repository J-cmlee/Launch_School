def include?(array, value)
  !!array.find_index(value)
end

def include?(array, value)
  array.each {|ele| return true if value == ele}
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false