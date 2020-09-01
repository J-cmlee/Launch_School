def print_in_box(text)
  horizontal_rule = "+#{'-' * (text.size + 2)}+"
  empty_line = "|#{' ' * (text.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{text} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box('To boldly go where no one has gone before.')