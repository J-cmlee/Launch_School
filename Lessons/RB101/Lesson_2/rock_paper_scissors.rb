# Choices
# r = rock
# p = paper
# s = scissors
# l = lizard
# k = Spock
VALID_CHOICES = ['r', 'p', 's', 'l', 'k']

# Prompt method
def prompt(message)
  Kernel.puts("=> #{message}")
end

# Win condition check
def win?(first, second)
  # Winning hash combinations
  win_hash = {
    'r' => ['l', 's'],
    'p' => ['r', 'k'],
    's' => ['p', 'l'],
    'l' => ['k', 'p'],
    'k' => ['s', 'r']
  }
  # Checks if the second player's choice is included in the first player's key value
  win_hash[first].include?(second)
end

# Display result method
def display_result(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("The computer won!")
  else
    prompt("It's a tie")
  end
end

# Main Game Loop
loop do
  player = '' # Initialize player choice

  # Loop until valid choice
  loop do
    prompt("Choose one: [r]ock, [p]aper, [s]cissors, [l]izard, Spoc[k]")
    player = Kernel.gets().chomp()

    if VALID_CHOICES.include?(player)
      break
    else
      prompt("That is not a valid choice")
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
