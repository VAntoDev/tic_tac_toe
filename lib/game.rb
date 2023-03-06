# frozen_string_literal: true

require_relative './grid'

# Game execution
class Game < Grid
  def initialize
    @current_grid = Grid.new
  end

  def execution
    start
    loop do
      round
      @current_grid.display
      if win_check == true
        break
      end
    end
    restart
  end

  def start
    @current_grid.display
    @player1 = Player.new('X')
    @player2 = Player.new('O')
    @turn = true
  end

  def round
    if @turn == true
      puts "\nYour turn player one! Place your X"
      @turn = false if @player1.add_symbol_at(gets.chomp.to_i) == true       
    else
      puts "\nYour turn player two! Place your O"
      @turn = true if @player2.add_symbol_at(gets.chomp.to_i) == true   
    end
  end

  def win_check
    if win_condition == true && @turn == false
      puts 'Player one wins!'
      return true
    elsif win_condition == true && @turn == true
      puts 'Player two wins!'
      return true
    elsif win_condition == "Draw"
      puts 'Its a draw!'
      return true
    end
  end

  def restart
    puts 'Do you want to play again? Press Y to restart'
    if gets.chomp.upcase == 'Y'
      puts 'Lets restart!'
      new_game = Game.new
      new_game.execution
    else
      puts 'Goodbye!'
    end
  end
  
end

=begin
  
def game_start
  @current_grid.display
  player1 = Player.new('X')
  player2 = Player.new('O')
  turn = true

  loop do
    if turn == true
      puts "\nYour turn player one! Place your X"
      turn = false if player1.add_symbol_at(gets.chomp.to_i) == true       
    else
      puts "\nYour turn player two! Place your O"
      turn = true if player2.add_symbol_at(gets.chomp.to_i) == true   
    end
    
    @current_grid.display

    if win_condition == true && turn == false
      puts 'Player one wins!'
      break
    elsif win_condition == true && turn == true
      puts 'Player two wins!'
      break
    elsif win_condition == "Draw"
      puts 'Its a draw!'
      break
    end
  end

  puts 'Do you want to play again? Press Y to restart'
  if gets.chomp.upcase == 'Y'
    puts 'Lets restart!'
    new_game = Game.new
    new_game.game_start
  else
    puts 'Goodbye!'
  end
end

=end
