# =========
# Constants
# =========

SUITS = {
  "H" => "Hearts",
  "D" => "Diamonds",
  "S" => "Spades",
  "C" => "Clubs"
}

VALUES = {
  "J" => "Jack",
  "Q" => "Queen",
  "K" => "King",
  "A" => "Ace"
}

MAX_LIMIT = 21
DEALER_LIMIT = 17
MAX_SCORE = 5
DELAY_VALUE = 1
STARTING_SIZE = 2

# =======
# Methods
# =======

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system("clear")
end

# Deck Structure
# H = Hearts
# D = Diamonds
# S = Spades
# C = Clubs
# Values = 2-10, J, Q, K, A
# Deck will contain cards like [["H", "1"], ["H", "2"], ["H", "3"]]

# This will return a new shuffled deck
def generate_deck
  # Symbol Array
  suits = ['H', 'D', 'S', 'C']
  # Value Array
  values = [*2..10].map(&:to_s) + ['J', 'Q', 'K', 'A']
  # Deck
  suits.product(values).shuffle # return shuffled deck
end

def deal!(deck)
  deck.pop
end

def initiate_hands!(player, dealer, deck)
  STARTING_SIZE.times do
    player << deal!(deck)
    dealer << deal!(deck)
  end
end

def card_name(card)
  symbol_name = SUITS[card[0]]
  value_name = if card[1].to_i == 0
                 VALUES[card[1]]
               else
                 card[1]
               end
  value_name + " of " + symbol_name
end

def calculate_aces(values, sum)
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > MAX_LIMIT
  end
end

def total_value(cards)
  values = cards.map { |card| card[1] }

  sum = 0
  values.each do |value|
    sum += if value == 'A'
             11
           elsif value.to_i == 0 # case for J,Q,K
             10
           else
             value.to_i
           end
  end

  # correction for Aces
  calculate_aces(values, sum)
  sum
end

def display_player_summary(player, dealer)
  clear_screen
  prompt "Dealer Card: #{card_name(dealer[0])} and ?"
  prompt ""
  prompt "Your cards:"
  player.each { |card| prompt((card_name(card))) }
  prompt "Total Value: #{total_value(player)}"
  prompt ""
end

def busted?(hand)
  total_value(hand) > MAX_LIMIT
end

def player_turn!(player, dealer, deck)
  loop do
    display_player_summary(player, dealer)
    prompt "[H]it or [S]tay? (H/S)"
    answer = gets.chomp.downcase
    case answer
    when 'h'
      player << deal!(deck)
    when 's'
      break
    else
      prompt "Wrong choice"
      sleep DELAY_VALUE
    end
    break if busted?(player)
  end
end

def display_dealer_turn(player_total, dealer)
  clear_screen
  prompt "Your total: #{player_total}"
  prompt ""
  prompt "Dealer Cards:"
  dealer.each do |card|
    sleep DELAY_VALUE
    prompt(card_name(card))
  end
end

def dealer_turn!(player_total, dealer, deck)
  display_dealer_turn(player_total, dealer)

  while total_value(dealer) < DEALER_LIMIT
    sleep DELAY_VALUE
    dealer << deal!(deck)
    prompt card_name(dealer.last)
  end
  prompt "Dealer total: #{total_value(dealer)}"
end

def calculate_winner!(player_total, dealer_total, score)
  if player_total > MAX_LIMIT
    score[:dealer] += 1
    return :dealer
  elsif (dealer_total > MAX_LIMIT) ||
        (player_total > dealer_total)
    score[:player] += 1
    return :player
  elsif dealer_total > player_total
    score[:dealer] += 1
    return :dealer
  end
  nil
end

def winner_message(winner)
  case winner
  when :dealer then prompt "You have lost"
  when :player then prompt "You have won"
  else
    prompt "It is a tie"
  end
  prompt "Press Enter to continue"
  gets.chomp
end

def play_again?
  loop do
    prompt "Do you want to play again? (Y/N)"
    answer = gets.chomp.downcase
    case answer
    when 'y' then return true
    when 'n' then return false
    else
      prompt "Invalid choice"
    end
  end
end

def winner?(score)
  if score[:player] == MAX_SCORE
    "Player"
  elsif score[:dealer] == MAX_SCORE
    "Dealer"
  end
end

def display_score(score)
  clear_screen
  prompt "==========="
  prompt "Score Board"
  prompt "==========="
  prompt "Player: #{score[:player]} Dealer: #{score[:dealer]}"
  if winner?(score)
    prompt "The winner is the #{winner?(score)}"
  end
  prompt "Press Enter to continue"
  gets.chomp
end

def display_player_busted(player, dealer)
  display_player_summary(player, dealer)
  prompt "You have busted!"
end

def display_introduction
  clear_screen
  prompt "GAME OF #{MAX_LIMIT}"
  prompt ""
  prompt "Player first to #{MAX_SCORE} wins!"
  prompt "Press Enter to continue"
  gets.chomp
end

def display_farewell
  prompt "Thank you playing!"
end

# ==============
# Main Game Loop
# ==============

display_introduction
loop do
  score = { player: 0, dealer: 0 }
  # score loop
  loop do
    deck = generate_deck
    player = []
    dealer = []
    initiate_hands!(player, dealer, deck)
    player_turn!(player, dealer, deck)
    player_total = total_value(player)
    if busted?(player)
      display_player_busted(player, dealer)
    else
      dealer_turn!(player_total, dealer, deck)
    end
    dealer_total = total_value(dealer)
    winner_message(calculate_winner!(player_total, dealer_total, score))
    display_score(score)
    break if winner?(score)
  end
  break unless play_again?
end
display_farewell
