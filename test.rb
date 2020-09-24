# frozen_string_literal: true

def fizzbuzz(start_num, end_num)
  output_array = []
  (start_num..end_num).each do |ele|
    if (ele % 5 == 0) && (ele % 3 == 0)
      output_array << 'Fizzbuzz'
    elsif (ele % 5) == 0
      output_array << 'Buzz'
    elsif ele % 3 == 0
      output_array << 'Fizz'
    else
      output_array << ele
    end
  end
  output_array.join(", ")
end

p fizzbuzz(1, 15)
