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

  def reveal
    @revealed = true
  end

  def to_s
    "#{is_bomb ? 'X' : 'O'} (#{pos_x}, #{pos_y})"
  end
end
