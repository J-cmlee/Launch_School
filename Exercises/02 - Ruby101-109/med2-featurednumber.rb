def featured(number)
  return "There is no possible number that fulfills those requirements" if number > 9876543201 
  (number+1).upto(9876543201) do |i|
    return i if ("0".."9").all?{|c| i.to_s.count(c) <= 1} && i %7 == 0 && i.odd?
  end
end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

def featured2(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end