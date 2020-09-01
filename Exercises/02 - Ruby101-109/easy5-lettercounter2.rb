def word_sizes(text)
  sizes = Hash.new(0)
  text.split(' ').each do |word|
    clean_word = word.delete('^A-Za-z')
    sizes[clean_word.length] += 1
  end
  sizes
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}