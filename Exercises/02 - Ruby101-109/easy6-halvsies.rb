def merge(arr1, arr2)
  output = []
  arr1.each {|ele| output << ele if !output.include?(ele)}
  arr2.each {|ele| output << ele if !output.include?(ele)}
  output
end

def merge2(array_1, array_2)
  array_1 | array_2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]