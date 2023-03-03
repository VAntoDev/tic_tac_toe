class Grid

  def initialize
    @@grid_rows = [
             [1, 2, 3],
             [4, 5, 6],
             [7, 8, 9]
            ]
    @@positioned_symbols = 0
  end    

  def display
    puts @@grid_rows[0].join("|")
    puts "-+-+-"
    puts @@grid_rows[1].join("|")
    puts "-+-+-"
    puts @@grid_rows[2].join("|")
  end

  def win_condition
    
    @@grid_rows.each_with_index do | row, row_index |
      if @@grid_rows[row_index].uniq.count == 1
        return true
      end
    end

    for i in 0..2
      vertical = []
      @@grid_rows.each do | row |
        vertical.push(row[i])
      end
      if vertical.uniq.count == 1
        return true
      end
    end

    diagonal = []
    @@grid_rows.each_with_index do | row, row_index |
      diagonal.push(row[row_index])
    end
    if diagonal.uniq.count == 1
      return true
    end

    diagonal = []
    @@grid_rows.reverse.each_with_index do | row, row_index |
      diagonal.push(row[row_index])
    end
    if diagonal.uniq.count == 1
      return true
    end

    if @@positioned_symbols == 9
      return "Draw"
    end
    
  end
end