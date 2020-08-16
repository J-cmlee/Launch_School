hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |pairs|
  pairs.each do |word|
    word.each_char {|char| puts char if "aeiou".include?(char)}
  end
end
