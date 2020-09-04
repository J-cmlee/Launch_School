def letter_case_count(text)
  count = { lowercase: 0, uppercase: 0, neither: 0 }
  text.each_char do |c|
    if ('A'..'Z').to_a.include?(c)
      count[:uppercase] += 1
    elsif ('a'..'z').include?(c)
      count[:lowercase] += 1
    else
      count[:neither] += 1
    end
  end
  count
end

def letter_case_count2(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }