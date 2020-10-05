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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]