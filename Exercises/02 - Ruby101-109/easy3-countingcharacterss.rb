puts "Please write word or multiple words: "
words = gets.chomp
condensed = words.delete(' ')
puts "There are #{condensed.length} characters in " + words