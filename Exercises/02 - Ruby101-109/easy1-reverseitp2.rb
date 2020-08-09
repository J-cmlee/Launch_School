def reverse_words(sentence)
  output = sentence.split(" ").map do |word|
    if word.length > 4
      word.reverse
    else
      word
    end
  end
  output.join(" ")
end

puts reverse_words('Professional') == "lanoisseforP"
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School') == "hcnuaL loohcS"