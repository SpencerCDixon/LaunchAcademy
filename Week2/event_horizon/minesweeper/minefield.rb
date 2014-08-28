require 'pry'
require 'pp'
class Minefield
  attr_reader :row_count, :column_count, :mine_count
  attr_accessor :blank_board, :game_board, :visible_board

  def initialize(row_count, column_count, mine_count)
    @column_count = column_count
    @row_count = row_count
    # Instance Variables I Made
    @mine_count = mine_count
    # Creates a blank gameboard and then puts bombs in
    @game_board = []
    initialize_game_board
    place_bombs(mine_count)

    # Creates visibility gameboard that checks for clicks
    @visible_board = []
    initialize_visibility_board
  end

  # Return true if the cell been uncovered, false otherwise.
  def cell_cleared?(row, col)
    visible_board[row][col] == "S"
  end

  # Uncover the given cell. If there are no adjacent mines to this cell
  # it should also clear any adjacent cells as well. This is the action
  # when the player clicks on the cell.
  def clear(row, col)
    visible_board[row][col] = "S"
    



  end

  # Check if any cells have been uncovered that also contained a mine. This is
  # the condition used to see if the player has lost the game.
  def any_mines_detonated?
    x_cordinates = (0...row_count)
    y_cordinates = (0...column_count)
      x_cordinates.each do |x|
        y_cordinates.each do |y|
          if game_board[x][y] == 'o' && visible_board[x][y] == 'S'
            return true
          end
        end
      end
    false
  end

  # Check if all cells that don't have mines have been uncovered. This is the
  # condition used to see if the player has won the game.
  def all_cells_cleared?
    x_cordinates = (0...row_count)
    y_cordinates = (0...column_count)
    success = row_count * column_count - mine_count
    counter = 0
      x_cordinates.each do |x|
        y_cordinates.each do |y|
          if game_board[x][y] == 'x' && visible_board[x][y] == 'S'
             counter += 1
             if counter == success
               return true
             end
          end
        end
      end
    false
  end

  # Returns the number of mines that are surrounding this cell (maximum of 8).
  def adjacent_mines(row, col)
    counter = 0

    [-1,0,1].each do |x|
      [-1,0,1].each do |y|
        if mine_present?(row + x,col + y)
          counter += 1
        end
      end
    end

    counter
  end

  # Returns true if the given cell contains a mine, false otherwise.
  def contains_mine?(row, col)
    if game_board[row][col] == 'o'
      true
    else
      false
    end
  end

# Methods That I Made

  def initialize_game_board
    column_count.times { @game_board << Array.new(row_count, "x") }
  end

  def place_bombs( mine_count )
    count = mine_count
    until count == 0
      x = rand(row_count)
      y = rand(column_count)
      if @game_board[x][y] == 'x'
        @game_board[x][y] = 'o'
        count -= 1
      end
    end
  end

  def initialize_visibility_board
    column_count.times { @visible_board << Array.new(row_count, "H")}
  end


  def mine_present?(row,col)
    game_board[row][col] == 'o'
  end
end
