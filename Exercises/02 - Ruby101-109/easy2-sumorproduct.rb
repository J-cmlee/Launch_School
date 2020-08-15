def prompt(message)
  puts '>> ' + message
end

prompt('Please nter an integer greater than 0: ')
value = gets.chomp.to_i
prompt("Enter 's' to compute the sum, 'p' to compute the product.")
selection = gets.chomp

case selection
when 's'
  sum = 1.upto(value).reduce(:+)
  prompt("The sum of the integers between 1 and #{value} is #{sum}")
when 'p'
  product = 1.upto(value).reduce(:*)
  prompt("The product of the integers between 1 and #{value} is #{product}")
else
  prompt('Error')
end
