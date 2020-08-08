# =====================
# Constant Declarations
# =====================

# Display Messages
require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')

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
  WIN_HASH[first].include?(second)
end

# Display result method
def display_result(player, computer)
  if win?(player, computer)
    prompt(MESSAGES["round_win"])
  elsif win?(computer, player)
    prompt(MESSAGES["round_lose"])
  else
    prompt(MESSAGES["round_tie"])
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

# Display score
def display_score(_player, _computer, score)
  prompt("Current score is Player: #{score[:player]}; Computer #{score[:computer]}")
end

# Retrieve Move
def retrieve_move
  player = ''
  loop do
    prompt(MESSAGES["move_prompt"])
    player = Kernel.gets().chomp().downcase

    if VALID_CHOICES.include?(player)
      break
    else
      prompt("That is not a valid choice")
    end
  end
  player
end

# Display Choices
def display_choices(player, computer)
  choice_hash = {
    'r' => 'Rock',
    'p' => 'Paper',
    's' => 'Scissors',
    'l' => 'Lizard',
    'k' => 'Spock'
  }
  Kernel.puts("You chose: #{choice_hash[player]}; Computer chose: #{choice_hash[computer]}")
end

# Match Over
def match_over?(score)
  score.value?(MAX_SCORE)
end

# Match Winner Display
def display_match_winner(score)
  if score[:player] == MAX_SCORE
    prompt("You have won!")
  else
    prompt("The computer has won!")
  end
end

# Play Again?
def retrieve_play_again_answer
  loop do
    prompt("Do you want to play again? (y/n): ")
    answer = gets.chomp.downcase
    if answer == 'y'
      return true
    elsif answer == 'n'
      return false
    end
    prompt("Please select 'y' or 'n'")
  end
end

# ==============
# Main Game Loop
# ==============

loop do
  # Variable Declarations
  player = '' # Initialize player choice
  score = { player: 0, computer: 0 } # Initialize Scores

  prompt("Rock, Paper, Scissors, Lizard, Spock")
  prompt("First player to #{MAX_SCORE} wins")

  # Loop until one player has reached Max score value
  loop do
    player = retrieve_move

    computer = VALID_CHOICES.sample
    system("clear")

    display_choices(player, computer)
    display_result(player, computer)
    update_score(player, computer, score)
    display_score(player, computer, score)
    break if match_over?(score)
  end
  display_match_winner(score)

  break unless retrieve_play_again_answer
  system("clear")
end
prompt("Thank you for playing!")
