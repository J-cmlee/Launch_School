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

# =======
# Methods
# =======

def prompt(msg)
  puts "=> #{msg}"
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
  2.times do
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
  values.select { |value| value == 'A' }.count.times do
    sum -= 10 if sum > MAX_LIMIT
  end
  sum
end

def display_player_summary(player, dealer)
  system("clear")
  prompt "Dealer Card: #{card_name(dealer[0])} and ?"
  prompt ""
  prompt "Your cards:"
  player.each { |card| prompt((card_name(card))) }
  prompt "Total Value: #{total_value(player)}"
  prompt ""
end

def busted?(hand)
  return true if total_value(hand) > MAX_LIMIT
  false
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
      sleep 1
    end
    break if busted?(player)
  end
end

# rubocop:disable Metrics/AbcSize
def dealer_turn!(player, dealer, deck)
  system("clear")
  prompt "Your total: #{total_value(player)}"
  prompt ""
  prompt "Dealer Cards:"
  dealer.each do |card|
    sleep 1
    prompt(card_name(card))
  end
  while total_value(dealer) < DEALER_LIMIT
    sleep 1
    dealer << deal!(deck)
    prompt card_name(dealer.last)
  end
  prompt "Dealer total: #{total_value(dealer)}"
end

def calculate_winner!(player, dealer, score)
  if total_value(player) > MAX_LIMIT
    prompt "You have lost"
    score[:dealer] += 1
  elsif (total_value(dealer) > MAX_LIMIT) ||
        (total_value(player) > total_value(dealer))
    prompt "You have won"
    score[:player] += 1
  elsif total_value(dealer) > total_value(player)
    prompt "You have lost"
    score[:dealer] += 1
  else
    prompt "It is a tie"
  end
  prompt "Press Enter to continue"
  gets.chomp
end
# rubocop:enable Metrics/AbcSize

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
    return "Player"
  elsif score[:dealer] == MAX_SCORE
    return "Dealer"
  end
  nil
end

def display_score(score)
  system("clear")
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

def display_introduction
  system("clear")
  prompt "=========="
  prompt "TWENTY-ONE"
  prompt "=========="
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
    if busted?(player)
      display_player_summary(player, dealer)
      prompt "You have busted!"
    else
      dealer_turn!(player, dealer, deck)
    end
    calculate_winner!(player, dealer, score)
    display_score(score)
    break if winner?(score)
  end
  break unless play_again?
end
display_farewell
