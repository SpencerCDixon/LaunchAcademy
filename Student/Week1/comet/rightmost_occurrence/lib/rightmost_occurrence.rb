def rightmost_occurrence(string, character)
 if string.include?(character)
  final_answer = []
  index = 0
  string.each_char do |c|
    if c.downcase == character.downcase
      final_answer << index
    end
    index += 1
  end
  final_answer[-1]
 else
   nil
 end
end
