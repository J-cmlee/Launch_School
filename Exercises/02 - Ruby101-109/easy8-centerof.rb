def center_of(string)
  mid_value = string.length/2
  if (string.length) % 2 == 1
    string[mid_value]
  else
    string[mid_value-1..mid_value]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

def center_of2(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end