require_relative 'grid'

class Game
  def initial_menu
    puts 'Welcome to DCCMinesweeper!'
    puts '1. Play DCCMinesweeper'
    puts '2. Exit'
    gets.to_i
  end

  def game_options_menu
    puts 'Enter de number of lines you want for your board'
    number_of_lines = gets.to_i
    puts 'Enter the number of bombs you want on your board'
    number_of_bombs = gets.to_i
    board = Grid.new(number_of_lines, number_of_bombs)
    #Here we should replace with the logic to view the board
    board.cells.each do |row|
      puts row.map(&:symbol).join(' ')
    end
  end
end

game = Game.new
playing = true
while playing
  option = game.initial_menu
  if option == 1
    game.game_options_menu
  else
    playing = false
  end
end
