class Cell
  attr_reader :pos_x, :pos_y, :is_bomb, :revealed, :count

  def initialize(pos_x, pos_y, is_bomb)
    @pos_x = pos_x
    @pos_y = pos_y
    @is_bomb = is_bomb
    @revealed = false
    @count = 0
  end

  def reveal
    @revealed = true
  end
end
