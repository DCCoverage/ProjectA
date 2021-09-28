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

  def reveal(grid_cells, dimension)
    @revealed = true
    return unless bombs_around.zero?

    flood_fill(grid_cells, dimension)
  end

  def count_bombs_around(grid_cells, dimension)
    if @is_bomb
      @bombs_around = -1
      return
    end

    total_bombs = 0
    (-1..1).each do |x_offset|
      neighbour_x = @pos_x + x_offset
      next if neighbour_x.negative? || neighbour_x >= dimension

      (-1..1).each do |y_offset|
        neighbour_y = @pos_y + y_offset
        next if neighbour_y.negative? || neighbour_y >= dimension

        neighbour = grid_cells[neighbour_x][neighbour_y]
        total_bombs += 1 if neighbour.is_bomb
      end
    end
    @bombs_around = total_bombs
  end

  def flood_fill(grid_cells, dimension)
    (-1..1).each do |x_offset|
      neighbour_x = @pos_x + x_offset
      next if neighbour_x.negative? || neighbour_x >= dimension

      (-1..1).each do |y_offset|
        neighbour_y = @pos_y + y_offset
        next if neighbour_y.negative? || neighbour_y >= dimension

        neighbour = grid_cells[neighbour_x][neighbour_y]
        neighbour.reveal(grid_cells, dimension) unless neighbour.revealed
      end
    end
  end

  def symbol
    is_bomb ? 'X' : bombs_around.to_s
  end

  def to_s
    revealed ? symbol : '░'
  end
end
