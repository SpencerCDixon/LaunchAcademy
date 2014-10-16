require 'pry'
def winner?(board)
  columns = 0..2

  # Horizontal Check
  board.each do |row|
    if row.join == "ooo" || row.join == "xxx"
      return true
    end
  end

  # Vertical Check
  columns.each do |num|
    vertical = []
    board.each do |row|
      vertical << row[num]
    end
    if vertical.join == "xxx" || vertical.join == "ooo"
      return true
    else
      vertical.clear
    end
  end

  # Diagonal Check
  count = 0
  down_right = []  
  board.each do |r|
   down_right << r[count]
   count += 1
  end
  if down_right.join == "xxx" || down_right.join == "ooo"
    return true
  end

  count_left = 2
  down_left = []  
  board.each do |r|
   down_left << r[count_left]
   count_left -= 1
  end
  if down_left.join == "xxx" || down_left.join == "ooo"
    return true
  end

  false
end

