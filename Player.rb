# Defines the structure of a TicTacToe player
class Player
  # Defines getter and setter methods
  attr_reader :marker, :name

  # Creates a new TicTacToe player with instance variables
  def initialize(marker)
    # Initialize player's official marker
    @marker = marker

    # Get and initialize player's name
    puts "Player '#{marker}': What is your name?"
    @name = gets.chomp
  end
end
