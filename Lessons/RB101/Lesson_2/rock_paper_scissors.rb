# =====================
# Constant Declarations
# =====================

# Choices
# r = rock
# p = paper
# s = scissors
# l = lizard
# k = Spock
VALID_CHOICES = ['r', 'p', 's', 'l', 'k']

# Winning hash combinations
WIN_HASH = {
  'r' => ['l', 's'],
  'p' => ['r', 'k'],
  's' => ['p', 'l'],
  'l' => ['k', 'p'],
  'k' => ['s', 'r']
}

# Maximum Score
MAX_SCORE = 5

# ===================
# Method Declarations
# ===================

# Prompt method
def prompt(message)
  Kernel.puts("=> #{message}")
end

# Win condition check
def win?(first, second)
  # Checks if the second player's choice is included in the first player's
  # value array
  WIN_HASH[first].include?(second)
end

# Display result method
def display_result(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("The computer won this round!")
  else
    prompt("It's a tie")
  end
end

# Update score
def update_score(player, computer, score)
  if win?(player, computer)
    score[:player] += 1
  elsif win?(computer, player)
    score[:computer] += 1
  end
end

# ==============
# Main Game Loop
# ==============

loop do
  # Variable Declarations
  player = '' # Initialize player choice
  score = { player: 0, computer: 0 } # Initialize Scores

  # Loop until one player has reached Max score value
  loop do
    # Loop until valid user choice
    loop do
      prompt("Choose one: [r]ock, [p]aper, [s]cissors, [l]izard, Spoc[k]")
      player = Kernel.gets().chomp()

      if VALID_CHOICES.include?(player)
        break
      else
        prompt("That is not a valid choice")
      end
    end

    computer = VALID_CHOICES.sample # Computer random choice
    system("clear") # Clear screen

    Kernel.puts("You chose: #{player}; Computer chose: #{computer}")
    display_result(player, computer)
    update_score(player, computer, score)
    prompt("Current score is Player: #{score[:player]}; Computer #{score[:computer]}")
    break if score.value?(MAX_SCORE)
  end

  if score[:player] == MAX_SCORE
    prompt("You have won!")
  else
    prompt("The computer has won!")
  end

  prompt("Do you want to play again? (y for yes, any other key to exit)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
  system("clear")
end
prompt("Thank you for playing!")
