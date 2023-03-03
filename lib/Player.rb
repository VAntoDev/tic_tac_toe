require_relative './Grid.rb'

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
  
        @@positioned_symbols += 1
        return true
      end
    end
  end

end