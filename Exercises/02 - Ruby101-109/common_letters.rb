def common_chars(word_array)
  first_word = word_array.shift
  first_word.chars.select do |char|
    word_array.all? do |word|
      if word.include?(char)
        word.slice!(word.index(char))
        true
      end
    end
  end
end

p common_chars(["bella", "label", "roller"])
p common_chars(["cool","lock","cook"])