def square_digits (num)
  return_int = ""
  digits_array = num.to_s.split("")
  digits_array.each do |digit|
    return_int << ((digit.to_i)**2).to_s
  end
  return_int.to_i
end

p square_digits(9119)