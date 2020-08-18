# =========
# Constants
# =========

SYMBOLS = {
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
  symbols = ['H', 'D', 'S', 'C']
  # Value Array
  values = [*1..10].map(&:to_s) + ['J', 'Q', 'K', 'A']
  # Deck
  deck = []
  symbols.each do |symbol|
    values.each do |value|
      deck << [symbol, value]
    end
  end
  deck.shuffle # return shuffled deck
end

def deal!(deck)
  deck.pop
end

def initiate_hands!(player, dealer, deck)
  2.times { player << deal!(deck) }
  2.times { dealer << deal!(deck) }
end

def card_name(card)
  symbol_name = SYMBOLS[card[0]]
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

def display_summary(player, dealer)
  system("clear")
  prompt "Dealer Card: #{card_name(dealer[0])}"
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
    display_summary(player, dealer)
    prompt "[H]it or [S]tay? (H/S)"
    answer = gets.chomp.downcase
    case answer
    when 'h'
      player << deal!(deck)
    when 's'
      prompt "You chose to stay"
      break
    else
      prompt "Wrong choice"
      sleep 1
    end
    break if busted?(player)
  end
end

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

# ==============
# Main Game Loop
# ==============

loop do
  deck = generate_deck
  player = []
  dealer = []
  initiate_hands!(player, dealer, deck)
  player_turn!(player, dealer, deck)
  if busted?(player)
    display_summary(player, dealer)
    prompt "You have busted!"
  else
    dealer_turn!(player, dealer, deck)
  end

  # test
  break
end
