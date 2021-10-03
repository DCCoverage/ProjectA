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

  def game_setup(game_dimention, number_of_bombs)
    @game_dimention = game_dimention
    @number_of_bombs = number_of_bombs
    @game_board = Grid.new(game_dimention, number_of_bombs)
  end

  def check_exit_game(user_input)
    if user_input == 'exit'
      @game_in_progress = false
      return true
    end
    false
  end

  def check_user_input(user_input)
    user_input = user_input.split(',')
    return false if user_input.length != 2

    user_input.each do |element|
      return false if !is_numeric?(element) || (element.to_i >= @game_dimention || element.to_i.negative?)
    end

    user_input.map(&:to_i)
  end

  def check_valid_game_setup(game_dimention)
    return true if is_numeric(game_dimention) && game_dimention <= 4 && game_dimention >= 1

    false
  end

  def reveal_guess(user_guess)
    @game_board.cells[user_guess[0]][user_guess[1]].reveal(@game_board.cells, @game_dimention)
    game_status_check(user_guess)
  end

  def game_status_check(user_guess)
    if @game_board.cells[user_guess[0]][user_guess[1]].is_bomb
      @game_lost = true
    else
      @game_board.cells.each do |row|
        row.each do |cell|
          return true if !cell.is_bomb && !cell.revealed
        end
      end
      @game_won = true
    end
    @game_in_progress = false
  end

  def get_mode(game_dimention)
    game_options = { 'easy' => [9, 10], 'medium' => [16, 40], 'hard' => [20, 99], 'extreme' => [27, 180] }

    return game_options['easy'][0], game_options['easy'][1] if game_dimention == 1
    return game_options['medium'][0], game_options['medium'][1] if game_dimention == 2
    return game_options['hard'][0], game_options['hard'][1] if game_dimention == 3
    return game_options['extreme'][0], game_options['extreme'][1] if game_dimention == 4
  end

  def is_numeric(input_text)
    return true if Integer(input_text) rescue false
  end
end
