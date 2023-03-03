# frozen_string_literal: true

require_relative './grid'

# Player informations and symbol placement
class Player < Grid
  attr_accessor :player_symbol

  def initialize(player_symbol)
    @player_symbol = player_symbol
  end

  def self.new_symbol_positioned
    @@positioned_symbols += 1
  end

  def add_symbol_at(position)
    @@grid_rows.each_with_index do |_row, row_index|
      if @@grid_rows[row_index].include?(position)
        substitute = @@grid_rows[row_index].find_index(position)
        @@grid_rows[row_index][substitute] = player_symbol
        Player.new_symbol_positioned
        return true
      end
    end
  end
end
