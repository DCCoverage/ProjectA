class UI
  def initialize(game)
    @game = game
  end

  def print_welcome_message
    puts 'Welcome to DCCMinesweeper!'
  end

  def print_ready_to_play_confirmation
    puts 'Are you ready to play Minesweeper?'
    puts 'Please select an option:'
    puts
    puts '1. Play DCCMinesweeper'
    puts '2. Exit'
    gets.to_i
  end

  def print_dimention_setup
    puts 'Enter de number of lines you want for your board'
    gets.to_i
  end

  def print_bombs_setup
    puts 'Enter the number of bombs you want to secretly hide in the board'
    gets.to_i
  end

  def print_user_guess_instructions
    puts "Enter coordinates for your guess separated by a comma (example: '2,3')"
    puts "Enter 'exit' to finish the game"
    gets.chomp
  end

  def print_incorrect_game_setup
    puts 'Those choices will not work for a game :( please try again'
  end

  def print_game_ready
    puts 'We are all set up :) get ready to play :)'
  end

  def print_wrong_input_message
    puts 'Wrong input, try again'
  end

  def print_mine_message
    puts 'KABOOM! you selected a bomb :( better luck next time'
  end

  def print_game_over_message
    puts 'Game over'
  end

  def print_win_message
    puts 'You have revelaed all not bomb cells! congratulations! you won! :)'
  end

  def print_end_game_message
    puts 'Thank you for playing!'
    puts 'Good bye'
  end

  def draw_board(board)
    puts 'Here is the current status of the board:'
    puts
    puts board.to_s
    puts
  end

  def clear_screen
    system('clear')
  end
end
