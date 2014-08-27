require 'pry'
require 'pp'
class Minefield
  attr_reader :row_count, :column_count
  attr_accessor :blank_board, :game_board

  def initialize(row_count, column_count, mine_count)
    @column_count = column_count
    @row_count = row_count
    # Instance Variables I Made

    # Creates a blank gameboard and then puts bombs in
    @game_board = []
    initialize_game_board
    place_bombs(mine_count)

  end

  # Return true if the cell been uncovered, false otherwise.
  def cell_cleared?(row, col)
    if game_board[row][col] == 'x'
      true
    else
      false
    end
  end

  # Uncover the given cell. If there are no adjacent mines to this cell
  # it should also clear any adjacent cells as well. This is the action
  # when the player clicks on the cell.
  def clear(row, col)
    if game_board[row][col] == 'x'
      true
    else
      false
    end
  end

  # Check if any cells have been uncovered that also contained a mine. This is
  # the condition used to see if the player has lost the game.
  def any_mines_detonated?

  end

  # Check if all cells that don't have mines have been uncovered. This is the
  # condition used to see if the player has won the game.
  def all_cells_cleared?
    false
  end

  # Returns the number of mines that are surrounding this cell (maximum of 8).
  def adjacent_mines(row, col)
    0
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

end
