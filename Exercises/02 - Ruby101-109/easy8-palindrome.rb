def leading_substrings(string)
  output_array = []
  current_string = ''
  string.chars.each do |char|
    current_string += char
    output_array << current_string
  end
  output_array
end

def substrings(string)
  output_array = []
  0.upto(string.length-1) do |index|
    current_string = string[index..-1]
    output_array << leading_substrings(current_string)
  end
  output_array.flatten
end

def is_palindrome?(string)
  return false if string.length == 1
  0.upto(string.length/2) do |index|
    opposite_index = -(index+1)
    return false if string[index] != string[opposite_index]
  end
  true
end

def palindrome?(string)
  string == string.reverse && string.size > 1
end

def palindromes(string)
  subarrays = substrings(string)
  subarrays.select do |subarray|
    is_palindrome?(subarray)
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
