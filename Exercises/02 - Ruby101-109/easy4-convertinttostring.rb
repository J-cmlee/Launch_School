# frozen_string_literal: true

DIGITS = %w[0 1 2 3 4 5 6 7 8 9].freeze

def integer_to_string(int)
  string = ''
  number = int
  return '0' if int == 0

  while number != 0
    string.prepend(DIGITS[number % 10])
    number /= 10
  end
  string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
