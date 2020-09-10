# frozen_string_literal: true

ENDINGS = ['.', '!', '?'].freeze

longest = 0
count = 0
sentence = []
longest_sentence = []

file = File.open('example2.txt')
file_data = file.readlines.map(&:chomp)
file_data = file_data.map {|ele| ele.split(" ")}
file_data = file_data.flatten
file_data.each do |ele|
  count += 1
  sentence << ele
  if ENDINGS.include?(ele[-1])
    if count > longest
      longest = count
      longest_sentence = sentence
    end
    count = 0
    sentence = []
  end
end
p longest_sentence
p longest
file.close

# text = File.read('example2.txt')
# sentences = text.split(/\.|\?|!/)
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# largest_sentence = largest_sentence.strip
# number_of_words = largest_sentence.split.size

# puts "#{largest_sentence}"
# puts "Containing #{number_of_words} words"