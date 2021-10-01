require_relative 'grid'

class Game
  attr_reader :game_board

  def initialize
    @game_board = 0
  end
  def initial_menu
    puts '1. Play DCCMinesweeper'
    puts '2. Exit'
    game_options_menu if gets.to_i == 1
    puts 'Good bye'
  end

  def game_options_menu
    puts 'Enter de number of lines you want for your board'
    number_of_lines = gets.to_i
    puts 'Enter the number of bombs you want on your board'
    number_of_bombs = gets.to_i
    @game_board = Grid.new(number_of_lines, number_of_bombs)
    game_display
  end

  def game_display
    puts @game_board.to_s
    make_guess
  end

  def begin
    puts 'Welcome to DCCMinesweeper!'
    initial_menu
  end

  def make_guess
    puts "Enter coordinates for your guess separated by a comma (example: '2,3')"
    puts "Enter 'exit' to finish the game"
    guess = gets.chomp
    if guess == "exit"
      puts "Thank you for playing!"
    else
      puts "trying to improve"
      game_display
    end
  end
end

game = Game.new
game.begin
# playing = true
# while playing
#   option = game.initial_menu
#   if option == 1
#     game.game_options_menu
#   else
#     playing = false
#   end
# end
