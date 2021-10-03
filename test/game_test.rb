require 'test_helper'
require 'game'

class GameTest < Test::Unit::TestCase
  def test_user_input
    game = Game.new
    wrong_input = '2,2,'
    check = game.check_user_input(wrong_input)
    assert_false check
  end
end
