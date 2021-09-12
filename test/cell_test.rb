require 'test_helper'
require 'cell'

class CellTest < Test::Unit::TestCase
  def test_initialization
    cell = Cell.new(1, 1, false)
    assert_not_nil cell
    assert_equal cell.pos_x, 1
    assert_equal cell.pos_y, 1
    assert_false cell.is_bomb
    assert_false cell.revealed
    assert_equal cell.bombs_around, 0
  end

  def test_reveal_method
    cell = Cell.new(1, 1, false)
    assert_false cell.revealed
    cell.reveal
    assert_true cell.revealed
  end
end
