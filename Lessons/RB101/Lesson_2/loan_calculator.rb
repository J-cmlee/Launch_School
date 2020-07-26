# Loan Calculator

# Takes the Loan Amount
# Takes the annual percentage rate
# Takes the loan duration

# Formula : m = p * (j / (1 - (1 + j)**(-n)))
# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

# Method to check if valid float value
def float?(input)
  Float(input)
rescue StandardError
  false
end

# Variables Declaration
principal = ''
percentage = ''
duration = ''

# Receives principal amount
loop do
  puts 'Please enter the loan amount (principal): '
  input = gets.chomp
  if float?(input)
    principal = input.to_f
    break
  else
    puts 'Please enter valid value'
  end
end

# Receives Annual Percentage Rate
loop do
  puts 'Please enter the Annual Percentage Rate (%): '
  input = gets.chomp
  if float?(input)
    percentage = input.to_f
    break
  else
    puts 'Please enter valid value'
  end
end

# Receives Loan Duration
loop do
  puts 'Please enter the Loan Duration (years): '
  input = gets.chomp
  if float?(input)
    duration = input.to_f
    break
  else
    puts 'Please enter valid value'
  end
end

# Convert to monthly interest rate
percentage = percentage / 100 / 12
# Convert duration from years to months
duration *= 12.0

# Calculate monthly payment
payment = principal * (percentage / (1 - (1 + percentage)**(-duration)))

puts("The monthly payment will be $#{payment.round(2)}")
