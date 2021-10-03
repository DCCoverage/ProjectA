require 'test_helper'
require 'game'

class GameTest < Test::Unit::TestCase
  NUMBER_OF_LINES = 8
  NUMBER_OF_BOMBS = 15

  def test_initialization
    game = Game.new
    assert_not_nil game
  end

  def test_game_setup
    game = valid_game
    assert_not_nil game.game_board
  end

  def test_check_valid_game_setup
    game = valid_game
    # negative value
    assert_false game.check_valid_game_setup(-1)
    # number too big
    assert_false game.check_valid_game_setup(5)
    # valid number
    assert_true game.check_valid_game_setup(2)
  end

  def test_check_exit_game
    game = valid_game
    # game not finished
    assert_false game.check_exit_game(0)
    assert_true game.game_in_progress
    # game finished
    assert_true game.check_exit_game('exit')
    assert_false game.game_in_progress
  end

  def test_check_user_input_length
    game = valid_game
    # too short
    assert_false game.check_user_input('1,')
    # too long
    assert_false game.check_user_input('1,2,3')
    # extra comma
    assert_false game.check_user_input('1,2,')
    # length ok
    assert_equal game.check_user_input('1,2'), [1, 2]
  end

  def test_check_user_input_inside_limits
    game = valid_game
    # negative
    assert_false game.check_user_input('1,-1')
    assert_false game.check_user_input('-1,1')
    # bigger than the board dimentions
    assert_false game.check_user_input("1,#{NUMBER_OF_LINES}")
    assert_false game.check_user_input("#{NUMBER_OF_LINES},1")
  end

  def test_check_user_input_numeric
    game = valid_game
    assert_false game.check_user_input('hello,1')
  end

  def test_reveal_guess
    game = valid_game
    game.reveal_guess([1, 2])
    assert_true game.game_board.cells[1][2].revealed
    assert_true game.game_in_progress
  end

  def test_losing_guess
    game = valid_game
    game.reveal_guess([2, 0])
    assert_true game.game_board.cells[2][0].revealed
    assert_false game.game_in_progress
    assert_true game.game_lost
  end

  def test_winning_guess
    game = valid_game
    reveal_except_one(game)

    game.reveal_guess([NUMBER_OF_LINES - 1, NUMBER_OF_LINES - 1])
    assert_false game.game_in_progress
    assert_true game.game_won
  end

  private

  def valid_game
    srand(1234)
    game = Game.new
    game.game_setup(NUMBER_OF_LINES, NUMBER_OF_BOMBS)
    game
  end

  def reveal_except_one(game)
    (0...NUMBER_OF_LINES).each do |x_index|
      (0...NUMBER_OF_LINES - 1).each do |y_index|
        game.game_board.cells[x_index][y_index].reveal(game.game_board.cells, NUMBER_OF_LINES)
      end
    end
  end
end
