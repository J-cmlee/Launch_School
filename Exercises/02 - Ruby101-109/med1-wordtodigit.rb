DIGITS = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def word_to_digit(sentence)
  words = sentence.split(' ')
  words.each_with_index do |word, index|
    check_word = word[0..-2]
    if DIGITS.keys.include?(check_word)
      words[index] = DIGITS[check_word] + word[-1]
    end
  end
  words.each_with_index do |word, index|
    if DIGITS.keys.include?(word)
      words[index] = DIGITS[word]
    end
  end
  words.join(" ")
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit2(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end