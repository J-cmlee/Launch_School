def multiply_all_pairs(arr1, arr2)
  product_array = []
  arr1.each do |ele1|
    arr2.each do |ele2|
      product_array << ele1 * ele2
    end
  end
  product_array.sort
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

