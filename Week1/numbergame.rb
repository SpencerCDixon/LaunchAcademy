#
# CHOSEN_NUMBER = 30
#
# def play_game
#
# print "Guess a number between 1 and 100: "
# guessed_number = gets.chomp.to_i
#
#   while true
#     if guessed_number > CHOSEN_NUMBER
#       puts "Too high."
#       play_game
#     elsif guessed_number < CHOSEN_NUMBER
#       puts "Too low."
#       play_game
#     else
#       puts "You win!"
#       puts "Play again?"
#       answer = gets.chomp
#         if answer == 'yes'
#           play_game
#         else
#           exit
#         end
#     end
#   end
# end
#
# play_game

### Easier version

HIDDEN_NUM = 30
print "Guess a number between 1 and 100: "
guess = gets.chomp.to_i

while HIDDEN_NUM == guess do
  print "You win!"
  if guess > HIDDEN_NUM
    puts "Too high."
  else
    puts "Too low."
  end
print "Guess a number between 1 and 100: "
guess = gets.chomp.to_i
end
