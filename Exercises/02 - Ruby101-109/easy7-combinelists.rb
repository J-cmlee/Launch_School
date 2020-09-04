def interleave(arr1, arr2)
  output_array = []
  counter = 0
  while counter < arr1.length
    output_array << arr1[counter]
    output_array << arr2[counter]
    counter += 1
  end
  output_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']