require_relative 'cell'

class Grid
  attr_reader :cells

  def initialize(number_of_lines, number_of_bombs)
    @number_of_lines = number_of_lines
    @number_of_bombs = number_of_bombs
    @cells = []
    (0...number_of_lines).each do |row|
      grid_row = []
      (0...number_of_lines).each do |column|
        new_cell = Cell.new(row, column, false)
        grid_row << new_cell
      end
      @cells << grid_row
    end
    randomize_bombs
  end

  def randomize_bombs
    options = []
    (0...@number_of_lines).each do |row|
      (0...@number_of_lines).each do |column|
        options << [row, column]
      end
    end
    (0...@number_of_bombs).each do
      position = options[rand(0...options.length)]
      @cells[position[0]][position[1]].is_bomb = true
      options.delete(position)
    end
  end
end
