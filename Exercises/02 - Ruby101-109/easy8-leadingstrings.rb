def leading_substrings(string)
  output_array = []
  current_string = ''
  string.chars.each do |char|
    current_string += char
    output_array << current_string
  end
  output_array
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def leading_substrings2(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end