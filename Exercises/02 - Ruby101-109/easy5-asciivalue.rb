def ascii_value(string)
  value = 0
  string.each_char do |char|
    value += char.ord
  end
  value
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0