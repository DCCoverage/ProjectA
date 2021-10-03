require_relative 'cell'

class Grid
  attr_reader :cells, :number_of_bombs

  def initialize(dimension, number_of_bombs)
    @dimension = dimension
    @number_of_bombs = if number_of_bombs <= dimension**2
                         number_of_bombs
                       else
                         dimension**2 - 1
                       end
    @cells = []
    (0...dimension).each do |row|
      grid_row = []
      (0...dimension).each do |column|
        new_cell = Cell.new(row, column, false)
        grid_row << new_cell
      end
      @cells << grid_row
    end
    randomize_bombs
    set_bomb_counts
  end

  def randomize_bombs
    options = []
    (0...@dimension).each do |row|
      (0...@dimension).each do |column|
        options << [row, column]
      end
    end
    (0...@number_of_bombs).each do
      position = options[rand(0...options.length)]
      @cells[position[0]][position[1]].is_bomb = true
      options.delete(position)
    end
  end

  def set_bomb_counts
    @cells.each do |row|
      row.each do |cell|
        cell.count_bombs_around(@cells, @dimension)
      end
    end
  end

  # Override Grid Cells for testing purposes
  def override_cells(new_cells)
    @cells = new_cells
    set_bomb_counts
  end

  def spaced_index(index)
    index.to_s.rjust((@dimension - 1).to_s.length, '0')
  end

  def stretched_pipe
    "═#{'═' * (@dimension - 1).to_s.length}═"
  end

  def spaced_cell(cell)
    "║ #{cell.to_s.center((@dimension - 1).to_s.length, ' ')} ║"
  end

  def build_body(indentation)
    body = ''
    @cells.each_with_index do |item, index|
      body += "#{indentation}#{" ╔#{stretched_pipe}╗" * @dimension}\n"
      vertical_index = index.to_s.rjust(indentation.length, '0')
      body += "#{vertical_index} #{(item.map { |cell| spaced_cell(cell) }).join(' ')}\n"
      body += "#{indentation}#{" ╚#{stretched_pipe}╝" * @dimension}\n"
    end
    body
  end

  def to_s
    max_index_width = (@dimension - 1).to_s.length
    indentation = ' ' * max_index_width
    template = "#{indentation}   #{(0...@dimension).map { |index| spaced_index(index) }.join '     '}\n"
    template += build_body indentation
    template
  end
end

# useful way to visualize a grid
# a = Grid.new(5, 10)
# a.cells.each do |row|
#   puts row.map(&:symbol).join(' ')
# end
