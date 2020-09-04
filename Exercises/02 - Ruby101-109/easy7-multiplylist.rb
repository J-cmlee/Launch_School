def multiply_list(arr1, arr2)
  new_list = []
  arr1.each_with_index {|ele, index| new_list << ele * arr2[index]}
  new_list
end

p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
