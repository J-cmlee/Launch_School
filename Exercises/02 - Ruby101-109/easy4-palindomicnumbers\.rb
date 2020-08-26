def palindromic_number?(value)
  check_string = value.to_s
  check_string == check_string.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true