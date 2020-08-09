def stringy(number)
  counter = true
  output = ""
  number.times do
    if counter == true
      output << '1'
      counter = false
    else
      output << '0'
      counter = true
    end
  end
  output
end

def stringy2(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'