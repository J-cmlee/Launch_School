# frozen_string_literal: true

def square(value)
  value**2
end

p square(5) == 25

def power(value, exponential)
  value**exponential
end

p power(5, 3) == 125

def power2(value, exponential)
  product = value
  (exponential-1).times do
    product *= value
  end
  product
end

p power2(5, 3) == 125

