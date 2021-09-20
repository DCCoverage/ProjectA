class Cell
  attr_reader :pos_x, :pos_y, :revealed, :bombs_around
  attr_accessor :is_bomb

  def initialize(pos_x, pos_y, is_bomb)
    @pos_x = pos_x
    @pos_y = pos_y
    @is_bomb = is_bomb
    @revealed = false
    @bombs_around = 0
  end

  def reveal(grid_cells, number_of_lines)
    if self.bombs_around == 0
      self.flood_fill(grid_cells, number_of_lines)
    else
      @revealed = true
    end
  end

  def count_bombs_around(grid_cells, number_of_lines)
    if @is_bomb
      @bombs_around = -1
      return
    end

    total_bombs = 0
    (-1..1).each do |x_offset|
      neighbour_x = @pos_x + x_offset
      next if neighbour_x.negative? || neighbour_x >= number_of_lines

      (-1..1).each do |y_offset|
        neighbour_y = @pos_y + y_offset
        next if neighbour_y.negative? || neighbour_y >= number_of_lines

        neighbour = grid_cells[neighbour_x][neighbour_y]
        total_bombs += 1 if neighbour.is_bomb
      end
    end
    @bombs_around = total_bombs
  end

  def flood_fill(grid_cells, number_of_lines)
    if @revealed || @bombs_around > 0
      return
    end
    @revealed = true
    (-1..1).each do |x_offset|
      neighbour_x = @pos_x + x_offset
      next if neighbour_x.negative? || neighbour_x >= number_of_lines

      (-1..1).each do |y_offset|
        neighbour_y = @pos_y + y_offset
        next if neighbour_y.negative? || neighbour_y >= number_of_lines

        neighbour = grid_cells[neighbour_x][neighbour_y]
        neighbour.flood_fill(grid_cells, number_of_lines)
      end
    end
  end

  def symbol
    is_bomb ? 'X' : bombs_around.to_s
  end
end
