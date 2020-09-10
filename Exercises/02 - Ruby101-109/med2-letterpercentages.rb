LOWERCASE = ('a'..'z').to_a
UPPERCASE = ('A'..'Z').to_a

def letter_percentages(string)
  count = {lowercase: 0, uppercase: 0, neither: 0}
  total = string.length
  string.chars.each do |letter|
    if LOWERCASE.include?(letter)
      count[:lowercase] += 1
    elsif UPPERCASE.include?(letter)
      count[:uppercase] += 1
    else
      count[:neither] += 1
    end
  end
  count.each do |key, value|
    count[key] = (value.to_f / total * 100)
  end
  count
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

def letter_percentages2(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: [], uppercase: [], neither: [] }
  characters = string.chars
  length = string.length

  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }

  calculate(percentages, counts, length)

  percentages
end

def calculate(percentages, counts, length)
  percentages[:uppercase] = (counts[:uppercase] / length.to_f) * 100
  percentages[:lowercase] = (counts[:lowercase] / length.to_f) * 100
  percentages[:neither] = (counts[:neither] / length.to_f) * 100
end