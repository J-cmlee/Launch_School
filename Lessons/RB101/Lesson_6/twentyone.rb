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

def card_name(card)
  symbol_name = SYMBOLS[card[0]]
  value_name = ''
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
    sum -= 10 if sum > 21
  end
  sum
end

# Testing Area
