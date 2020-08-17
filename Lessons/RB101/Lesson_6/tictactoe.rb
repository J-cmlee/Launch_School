require 'pry'

# =========
# Constants
# =========
TURN = "choose"
INITIAL_MARKER = " "
PLAYER_MARKER = "X"
COMPUTER_MARKER = "O"
WIN_SCORE = 5
WINNING_LINES = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
  [1, 5, 9], [3, 5, 7] # diagonals
]

# =======
# Methods
# =======
def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd, points)
  system("clear")
  puts "First to #{WIN_SCORE} wins!"
  puts "Player: #{PLAYER_MARKER}. Score: #{points[:player]}" \
       "  Computer: #{COMPUTER_MARKER}. Score: #{points[:computer]}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ' '
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp
    break if empty_squares(brd).map(&:to_s).include?(square)
    prompt "Sorry, that is not a valid choice"
  end
  brd[square.to_i] = PLAYER_MARKER
end

def find_at_risk_square(line, board, marker)
  if board.values_at(*line).count(marker) == 2
    board.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first
  end
end

# rubocop:disable Metrics/MethodLength
def computer_places_piece!(brd)
  square = nil

  # offense first
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # just pick 5 or a square
  if !square
    square = if brd[5] == INITIAL_MARKER
               5
             else
               empty_squares(brd).sample
             end
  end

  brd[square] = COMPUTER_MARKER
end
# rubocop:enable Metrics/MethodLength

def place_piece!(brd, player)
  case player
  when "player" then player_places_piece!(brd)
  when "computer" then computer_places_piece!(brd)
  end
end

def turn_order
  if TURN == "choose"
    loop do
      prompt "Please select which player goes first:"
      prompt "[C]omputer or [P]layer (C/P)"
      answer = gets.chomp.downcase
      case answer
      when "c" then return "computer"
      when "p" then return "player"
      else
        prompt "Invalid selection"
      end
    end
  else
    TURN
  end
end

def alternate_player(current_player)
  case current_player
  when "computer" then "player"
  when "player" then "computer"
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def update_score(brd, score)
  case detect_winner(brd)
  when "Player"
    score[:player] += 1
  when "Computer"
    score[:computer] += 1
  end
end

def play_again?
  loop do
    prompt "Play again? (y or n)"
    answer = gets.chomp.downcase
    case answer
    when 'y' then return true
    when 'n' then return false
    else
      prompt "Please enter a valid response (y/n)"
    end
  end
end

# Introduction
system("clear")
prompt "======================"
prompt "Welcome to Tic-Tac-Toe"
prompt "======================"
prompt ""
prompt "Board is set as follows:"
prompt "1|2|3"
prompt "4|5|6"
prompt "7|8|9"
prompt ""
prompt "Turns will alternate to the loser of the previous round"
prompt "Press any key to continue"
gets.chomp

# Main game loop
loop do
  score = { player: 0, computer: 0 }
  # initialize move order
  current_player = turn_order

  # score loop
  loop do
    board = initialize_board
    # round loop
    loop do
      display_board(board, score)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      update_score(board, score)
      display_board(board, score)
      prompt "#{detect_winner(board)} won!"
    else
      display_board(board, score)
      prompt "It's a tie"
    end
    prompt "Press any key to continue"
    gets.chomp

    if score.value?(WIN_SCORE)
      prompt "Final Score: Player: #{score[:player]}" \
             " Computer: #{score[:computer]}"
      break
    end
  end
  break if play_again? == false
end

prompt "Thanks for playing Tic Tac Toe"
