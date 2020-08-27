def swap(sentence)
  words = sentence.split(" ")
  words = words.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  words.join(" ")
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'