
def winner?(board)
  board.each do |row|
    if row[0] == 'o' || row[0] == 'x'
      return true
    end
  end
end
