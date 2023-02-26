class Grid
  attr_accessor :rows #:first_row, :secnd_row, :third_row

  def initialize
    @rows = [[1, 2, 3],
             [4, 5, 6],
             [7, 8, 9]
            ]
  end    

  def display
    puts rows[0].join("|")
    puts "-+-+-"
    puts rows[1].join("|")
    puts "-+-+-"
    puts rows[2].join("|")
  end


end

class Player < Grid
  def initialize(player_symbol)
    @player_symbol = player_symbol
  end

  def add_symbol_at(position)
    
  end
end

new_grid = Grid.new
new_grid.display
