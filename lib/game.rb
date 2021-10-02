require_relative 'grid'
require_relative 'cell'

class Game
  attr_accessor :game_board, :game_dimention, :game_number_of_bombs, :game_in_progress, :game_lost, :game_won

  def initialize
    @game_board = nil
    @game_dimention = nil
    @game_number_of_bombs = nil
    @game_in_progress = true
    @game_lost = false
    @game_won = false
  end

  def game_setup(game_dimention, number_bombs)
    @game_dimention = game_dimention
    @game_number_of_bombs = number_bombs
    @game_board = Grid.new(game_dimention, number_bombs)
  end

  def game_display
    puts @game_board.to_s
    puts "Enter coordinates for your guess separated by a comma (example: '2,3')"
    puts "Enter 'exit' to finish the game"
    make_guess
  end

  def make_guess
    guess = gets.chomp
    if guess == 'exit'
      @game_in_progress = true
    else
      guess = guess.split(',')
      if check_user_input(guess)
        guess = guess.map(&:to_i)
        reveal_guess(guess)
      end
    end
  end

  def check_exit_game(user_input)
    return true if user_input == 'exit'

    false
  end

  def check_user_input(user_input)
    user_input = user_input.split(',')
    return false if user_input.length != 2

    user_input.each do |element|
      extra = element
      return false if element.to_i.to_s != extra || (element.to_i >= @game_dimention || element.to_i.negative?)
    end

    user_input
  end

  def check_valid_game_setup(game_dimention, number_of_bombs)
    return true if game_dimention.positive? && number_of_bombs.positive? && number_of_bombs <= game_dimention**2

    false
  end

  def reveal_guess(user_guess)
    @game_board.cells[user_guess[0]][user_guess[1]].reveal(@game_board.cells, @game_dimention)
    game_status_check
  end

  def game_status_check
    puts 'The idea here is to check the amount of remaining bombs :) work in progress'
  end
end

# game = Game.new
# game.begin
