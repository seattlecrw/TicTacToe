# Defines the structure and methods of a TicTacToe board
class Board
  # Defines getter method for grid
  attr_reader :grid, :winners

  # Creates a new TicTacToe board with instance variables
  def initialize
    # grid is the playing board
    @grid = []
    9.times do |i|
      @grid << " "
    end
  end

  # Prints example and current grid to screen
  def print
    puts " 1 | 2 | 3     #{grid[0]} | #{grid[1]} | #{grid[2]} "
    puts "-----------   -----------"
    puts " 4 | 5 | 6     #{grid[3]} | #{grid[4]} | #{grid[5]} "
    puts "-----------   -----------"
    puts " 7 | 8 | 9     #{grid[6]} | #{grid[7]} | #{grid[8]} "
  end

  # Determines if selected grid position is open
  def available?(position)
    grid[position - 1] == " "
  end

  # Determines if selected position wins the game
  def won?
    # winners is the 2d array of positions that would win the game
    # top row: horizontal, middle: vertical, bottom: diagonal
    winners = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
               [0, 3, 6], [1, 4, 7], [2, 5, 8],
               [0, 4, 8], [2, 4, 6]]
    winners.each do |line|
      pattern = ""
      line.each do |position|
        pattern << grid[position]
      end
      if pattern == "XXX" || pattern == "OOO"
        return pattern
      end
    end
    return ""
  end

  # Determines if there are no more moves to make
  def full?
    @grid.none? { |cell| cell == " " }
  end

  # Sets selected grid position
  def set_cell(position, marker)
    grid[position - 1] = marker
  end
end
