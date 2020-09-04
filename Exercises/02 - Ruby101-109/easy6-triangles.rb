# frozen_string_literal: true

def triangle(value)
  counter = 1
  while counter <= value
    puts "#{' ' * (value - counter)}#{'*' * counter}"

    counter += 1
  end
end

triangle(4)
