require 'test_helper'
require 'cell'
require 'grid'

def generate_3x3_mock_grid
  mock_grid_cells = [
    [Cell.new(0, 0, true), Cell.new(0, 1, false), Cell.new(0, 2, false)],
    [Cell.new(1, 0, false), Cell.new(1, 1, false), Cell.new(1, 2, false)],
    [Cell.new(2, 0, false), Cell.new(2, 1, false), Cell.new(2, 2, false)],
  ]

  mock_grid = Grid.new(3, 1)
  mock_grid.override_cells(mock_grid_cells)
  mock_grid
end

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

  def test_reveal_of_single_cell_method
    cell = Cell.new(0, 0, false)
    mock_grid = [[cell]]
    assert_false cell.revealed
    cell.reveal(mock_grid, 1)
    assert_true cell.revealed
  end

  def test_horizontal_flood_fill_on_cell_with_surrounding_bomb
    mock_grid = generate_3x3_mock_grid

    # Reveal middle cell (no flood fill)
    mock_grid.cells[1][1].reveal(mock_grid.cells, 3)

    assert_false mock_grid.cells[1][0].revealed
    assert_false mock_grid.cells[1][2].revealed
  end

  def test_vertical_flood_fill_on_cell_with_surrounding_bomb
    mock_grid = generate_3x3_mock_grid

    # Reveal middle cell (no flood fill)
    mock_grid.cells[1][1].reveal(mock_grid.cells, 3)

    assert_false mock_grid.cells[0][1].revealed
    assert_false mock_grid.cells[2][1].revealed
  end

  def test_left_diagonal_flood_fill_on_cell_with_surrounding_bomb
    mock_grid = generate_3x3_mock_grid

    # Reveal middle cell (no flood fill)
    mock_grid.cells[1][1].reveal(mock_grid.cells, 3)

    assert_false mock_grid.cells[0][0].revealed
    assert_false mock_grid.cells[2][2].revealed
  end

  def test_right_diagonal_flood_fill_on_cell_with_surrounding_bomb
    mock_grid = generate_3x3_mock_grid

    # Reveal middle cell (no flood fill)
    mock_grid.cells[1][1].reveal(mock_grid.cells, 3)

    assert_false mock_grid.cells[0][2].revealed
    assert_false mock_grid.cells[2][0].revealed
  end

  def test_horizontal_flood_fill_on_zero_cell
    mock_grid = generate_3x3_mock_grid

    # Reveal cell with 0 (flood fill all except bomb)
    mock_grid.cells[2][2].reveal(mock_grid.cells, 3)

    assert_true mock_grid.cells[2][0].revealed
    assert_true mock_grid.cells[2][1].revealed
  end

  def test_vertical_flood_fill_on_on_zero_cell
    mock_grid = generate_3x3_mock_grid

    # Reveal cell with 0 (flood fill all except bomb)
    mock_grid.cells[2][2].reveal(mock_grid.cells, 3)

    assert_true mock_grid.cells[1][2].revealed
    assert_true mock_grid.cells[2][2].revealed
  end

  def test_left_diagonal_flood_fill_on_on_zero_cell
    mock_grid = generate_3x3_mock_grid

    # Reveal cell with 0 (flood fill all except bomb)
    mock_grid.cells[2][2].reveal(mock_grid.cells, 3)

    # Bomb is not revealed
    assert_false mock_grid.cells[0][0].revealed
    assert_true mock_grid.cells[1][1].revealed
  end

  def test_non_adyacent_flood_fill_on_on_zero_cell
    mock_grid = generate_3x3_mock_grid

    # Reveal cell with 0 (flood fill all except bomb)
    mock_grid.cells[1][1].reveal(mock_grid.cells, 3)

    assert_false mock_grid.cells[0][1].revealed
    assert_false mock_grid.cells[1][0].revealed
  end

  def test_flood_fill_on_bomb
    mock_grid = generate_3x3_mock_grid

    # Reveal cell with 0 (flood fill all except bomb)
    mock_grid.cells[0][0].reveal(mock_grid.cells, 3)

    assert_false mock_grid.cells[0][1].revealed
    assert_false mock_grid.cells[1][0].revealed
  end

  def test_symbol
    bomb = Cell.new(1, 1, true)
    assert_equal bomb.symbol, 'X'
    cell = Cell.new(1, 1, false)
    assert_equal cell.symbol, '0'
  end
end
