require 'test_helper'
require 'grid'

class GridTest < Test::Unit::TestCase
  NUMBER_OF_LINES = 8
  NUMBER_OF_BOMBS = 15

  def test_initialization
    grid = Grid.new(NUMBER_OF_LINES, NUMBER_OF_BOMBS)
    assert_not_nil grid
  end

  def test_column_row_numbers
    grid = Grid.new(NUMBER_OF_LINES, NUMBER_OF_BOMBS)
    assert_equal grid.cells.length, NUMBER_OF_LINES
    grid.cells.each do |row|
      assert_equal row.length, NUMBER_OF_LINES
    end
  end

  def test_bomb_assignment
    grid = Grid.new(NUMBER_OF_LINES, NUMBER_OF_BOMBS)
    bombs_on_grid = 0
    grid.cells.each do |row|
      row.each do |cell|
        bombs_on_grid += 1 if cell.is_bomb
      end
    end
    assert_equal NUMBER_OF_BOMBS, bombs_on_grid
  end
end
