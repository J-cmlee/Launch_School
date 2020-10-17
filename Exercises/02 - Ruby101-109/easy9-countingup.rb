def sequence(upperlimit)
  return_array = []
  1.upto(upperlimit) do |value|
    return_array << value
  end
  return_array
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

def sequence(number)
  (1..number).to_a
end