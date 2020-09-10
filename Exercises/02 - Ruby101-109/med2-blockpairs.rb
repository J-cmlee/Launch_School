BLOCK_ARRAY = [['B','O'], ['G','T'], ['V','I'], ['X','K'],
['R','E'], ['L','Y'], ['D','Q'], ['F','S'], ['Z','M'], 
['C','P'], ['J','W'], ['N','A'], ['H','U']]

def block_word?(word)
  check_word = word.upcase
  disallowed_letters = []
  allowed_letters = BLOCK_ARRAY.flatten
  check_word.chars.each do |letter|
    return false unless allowed_letters.include?(letter)
    return false if disallowed_letters.include?(letter)

    BLOCK_ARRAY.each do |ele|
      if ele[0] == letter
        disallowed_letters << ele[1]
      elsif ele[1] == letter
        disallowed_letters << ele[0]
      end
    end
  end
  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word2?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end