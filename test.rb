def find_even_index(array)
  return 0 if array.sum == 0

  0.upto(array.length-1) do |i|
    return i if array[0..i-1].sum == array[i+1..-1].sum
  end
  -1
end

p find_even_index([1,2,3,4,3,2,1])
p find_even_index([1,2,3,4,5,6])
p find_even_index([20,10,-80,10,10,5,25])
p [20,10,-80,10,10,5,25].sum