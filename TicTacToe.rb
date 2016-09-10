#! usr/bin/env ruby

# Defines the structure and methods of a TicTacToe game
class TicTacToe
  # Requires Board and Player classes
  require './Player.rb'
  require './Board.rb'

  # Define getter and setter methods for instance variables
  attr_reader :playerX, :playerO
  attr_accessor :board

  # Creates a new TicTacToe game with instance variables
  def initialize
    # Initialize players and empty board
    @playerX = Player.new('X')
    @playerO = Player.new('O')
    @board = Board.new()

    # Start 'current' player with 'X'
    @current = @playerX
  end

  # Takes turns playing the game
  def play
    @board.print
    until over?
      select_cell(@current)
    end
  end

  private

  # Allows the current player to select a position and, if valid, plays
  def select_cell(player)
    puts "#{player.name}, please select a position for your #{player.marker}:"
    move = gets.chomp.to_i
    if @board.available?(move)
      board.set_cell(move, player.marker)
      puts "#{player.name} played cell \##{move.to_s}."
      @board.print
      swap_players
    else
      puts "Sorry, that play is not valid. Please try again."
    end
  end

  # Swaps current player to the next player
  def swap_players
    @current == @playerX ? @current = @playerO : @current = @playerX
  end

  # Once either the board full or game one, print game result
  def over?
    if @board.full?
      # result is a tie
      puts "Game Over! It's a Draw!"
      return true
    elsif @board.won? != ""
      @board.won? == "XXX" ? winner = @playerX : winner = @playerO
      puts "Congratulations, #{winner.name}! You won TicTacToe!"
      return true
    else
      return false
    end
  end
end

# initialize and play new game
TicTacToe.new.play
