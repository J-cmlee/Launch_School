VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("The computer won!")
  else
    prompt("It's a tie")
  end
end

player = ''

loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    player = Kernel.gets().chomp()

    if VALID_CHOICES.include?(player)
      break
    else
      prompt("That is not a valid player")
    end
  end

  computer = VALID_CHOICES.sample

  Kernel.puts("You chose: #{player}; Computer chose: #{computer}")
  display_result(player, computer)

  prompt("Do you want to play again?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
prompt("Thank you playing!")
