class Grid
  attr_accessor :rows 

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

new_grid = Grid.new
new_grid.display

puts ""

new_player = Player.new("X")
new_player.add_symbol_at(4)
new_grid.display

puts ""

new_player2 = Player.new("O")
new_player2.add_symbol_at(7)
new_grid.display
