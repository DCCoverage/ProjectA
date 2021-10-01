require_relative 'grid'

class Game
  attr_reader :game_board

  def initialize
    @game_board = nil
    @number_of_lines = nil
    @number_of_bombs = nil
  end

  def initial_menu
    puts '1. Play DCCMinesweeper'
    puts '2. Exit'
    game_setup_menu if gets.to_i == 1
    puts 'Good bye'
  end

  def game_setup_menu
    puts 'Enter de number of lines you want for your board'
    @number_of_lines = gets.to_i
    puts 'Enter the number of bombs you want on your board'
    @number_of_bombs = gets.to_i
    @game_board = Grid.new(@number_of_lines, @number_of_bombs)
    game_display
  end

  def game_display
    puts @game_board.to_s
    puts "Enter coordinates for your guess separated by a comma (example: '2,3')"
    puts "Enter 'exit' to finish the game"
    make_guess
  end

  def begin
    puts 'Welcome to DCCMinesweeper!'
    initial_menu
  end

  def check_user_input(user_input)
    user_input = user_input.split(',')
    return false if user_input.length != 2

    user_input.each do |element|
      extra = element
      return false if element.to_i.to_s != extra || (element.to_i >= @number_of_lines || element.to_i.negative?)
    end
  end

  def make_guess
    guess = gets.chomp
    if guess == 'exit'
      puts 'Thank you for playing!'
    else
      if check_user_input(guess)
        puts 'INPUT VALIDOOO A JUEGAARSS'
      else
        puts 'Input invalido, intentelo de nuevo'
      end
      game_display
    end
  end
end

game = Game.new
game.begin
