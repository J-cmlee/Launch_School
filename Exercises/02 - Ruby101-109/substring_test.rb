def substring_test(string1, string2)
  return false if string1.length < 2 || string2.length < 2

  0.upto(string1.length-2) do |left_index|
    (left_index+1).upto(string1.length-1) do |right_index|
      return true if string1[left_index..right_index] == string2[left_index..right_index]
    end
  end
  false
end

p substring_test("Something", "Fun")
p substring_test("Something", "Home")