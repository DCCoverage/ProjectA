require_relative 'game'
require_relative 'ui'

class Minesweeper
  attr_accessor :game, :ui

  def initialize
    @game = Game.new
    @ui = UI.new(@game)
  end

  def begin
    @ui.print_welcome_message

    if ready_to_play_confirmation

      game_dimention, number_of_bombs = set_your_game

      @game.game_setup(game_dimention, number_of_bombs)
      @ui.print_game_ready

      play_turn while @game.game_in_progress
    end

    if @game.game_lost
      @ui.clear_screen
      @ui.draw_board(@game.game_board)
      @ui.print_mine_message
      @ui.print_game_over_message
    elsif @game.game_won
      @ui.clear_screen
      @ui.draw_board(@game.game_board)
      @ui.print_win_message
    end
    @ui.print_end_game_message
  end

  private

  def play_turn
    @ui.clear_screen
    @ui.draw_board(@game.game_board)

    guess = enter_player_guess

    if @game.game_in_progress
      @game.reveal_guess(guess)
    end
  end

  def enter_player_guess
    loop do
      user_input = @ui.print_user_guess_instructions

      break if @game.check_exit_game(user_input)

      return @game.check_user_input(user_input) if @game.check_user_input(user_input)

      @ui.print_wrong_input_message
    end
  end

  def set_your_game
    loop do
      game_dimention = @ui.print_dimention_setup
      number_of_bombs = @ui.print_bombs_setup
      return game_dimention, number_of_bombs if @game.check_valid_game_setup(game_dimention, number_of_bombs)

      @ui.print_incorrect_game_setup
    end
  end

  def ready_to_play_confirmation
    loop do
      confirmation = @ui.print_ready_to_play_confirmation
      break true if confirmation == 1
      break false if confirmation == 2

      @ui.print_wrong_input_message
    end
  end
end

puts 'redy to rumble'
Minesweeper.new.begin
