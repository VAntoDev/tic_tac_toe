require_relative './grid'

class Game < Grid
  def initialize
    @current_grid = Grid.new
  end

  def game_start
    @current_grid.display
    player1 = Player.new("X")
    player2 = Player.new("O")
    turn = true

    while true
      if turn == true
        puts "Your turn player one! Place your X"
        if player1.add_symbol_at(gets.chomp.to_i) == true
          turn = false
        end
        puts ""
      else
        puts "Your turn player two! Place your O"
        if player2.add_symbol_at(gets.chomp.to_i) == true
          turn = true
        end
        puts ""
      end
      
      @current_grid.display

      if win_condition == true && turn == false
        puts "Player one wins!"
        break
      elsif win_condition == true && turn == true
        puts "Player two wins!"
        break
      elsif win_condition == "Draw"
        puts "Its a draw!"
        break
      end
    end

    puts "Do you want to play again? Press Y to restart"
    if gets.chomp.upcase == "Y"
      puts "Lets restart!"
      new_game = Game.new
      new_game.game_start
    else
      puts "Goodbye!"
    end
  end
  
end