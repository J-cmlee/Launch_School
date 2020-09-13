# frozen_string_literal: true

def sum_square_difference(n)
  square_sum = 0
  1.upto(n) do |value|
    square_sum += value**2
  end
  sum_square = ((1..n).to_a.sum)**2
  sum_square - square_sum
end

p sum_square_difference(3) == 22
# -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25_164_150
