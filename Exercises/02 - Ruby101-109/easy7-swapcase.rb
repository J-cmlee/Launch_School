def swapcase(text)
  new_text = ''
  text.each_char do |c|
    if ('A'..'Z').include?(c)
      new_text << c.downcase
    elsif ('a'..'z').include?(c)
      new_text << c.upcase
    else
      new_text << c
    end
  end
  new_text
end

def swapcase2(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'