class Grid

  def initialize
    @@grid_rows = [
             [1, 2, 3],
             [4, 5, 6],
             [7, 8, 9]
            ]
  end    

  def display
    puts @@grid_rows[0].join("|")
    puts "-+-+-"
    puts @@grid_rows[1].join("|")
    puts "-+-+-"
    puts @@grid_rows[2].join("|")
  end


end

class Player < Grid
  attr_accessor :player_symbol
  def initialize(player_symbol)
    @player_symbol = player_symbol
  end

  def add_symbol_at(position)
    @@grid_rows.each_with_index do | row, row_index |
      if @@grid_rows[row_index].include?(position)
        substitute = @@grid_rows[row_index].find_index(position)
        @@grid_rows[row_index][substitute] = player_symbol
      end
    end
  end
end

class Game 
  def initialize
    @current_grid = Grid.new
  end

  def game_start
    @current_grid.display
    player1 = Player.new("X")
    player2 = Player.new("O")
    while true
      player1.add_symbol_at(gets.chomp.to_i)
      @current_grid.display
      player2.add_symbol_at(gets.chomp.to_i)
      @current_grid.display
    end
  end
  
end

new_game = Game.new
new_game.game_start

=begin
new_grid = Grid.new
new_grid.display

puts ""

new_player = Player.new("X")
new_player.add_symbol_at(gets.chomp.to_i)
new_grid.display

puts ""

new_player2 = Player.new("O")
new_player2.add_symbol_at(7)
new_grid.display
=end