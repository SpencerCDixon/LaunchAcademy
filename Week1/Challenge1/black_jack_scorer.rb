# -*- coding: utf-8 -*-
require 'pry'

def assert_equals(a, b)
  if a != b
    raise "assertion failed: #{a} does not equal #{b}"
  end
end


def score(hand)
  # Calculate the best score for the given hand in Blackjack. Each card
  # is worth a certain amount of points:
  #
  # * A face card (K, Q, or J) is worth 10 points.
  # * Aces are worth either 1 or 11 points, whichever yields the score
  #   closest to 21 without exceeding it.
  # * All of the cards are worth their numeric value (2-10).
  #
  # `hand` contains an array of cards. Each card is represented
  # as a string combining the value and the suit.
  #
  # e.g. ["A♠", "2♥", "J♣", "10♦"]
if hand == []
  return 0
end

number_of_aces = 0 # number of aces to use later


hand.map! {|card| card.chop} # gets rid of symbols


number_of_aces = hand.count("A") # Gets rid of aces, keeps track
hand.delete("A")


hand.map! do |card|
  if card[0] == "J" || card[0] == "K" || card[0] == "Q"
    10
  else
    card.to_i
  end
end

if hand.size == 0
  sum = 0
else
  sum = hand.inject {|sum, num| sum + num}
end


# Add logic to figure out aces
  case number_of_aces
    when 0
      return sum
    when 1
      if sum < 11
        sum + 11
      else
        sum + 1
      end
    when 2
      if sum < 10
        sum + 12
      else
        sum + 2
      end
  end
end


assert_equals(score([]), 0)
assert_equals(score(["2♠"]), 2) #remove that ace, king
assert_equals(score(["10♣"]), 10)
assert_equals(score(["K♣"]), 10)
assert_equals(score(["A♦"]), 11)
assert_equals(score(["2♠", "8♣"]), 10)
assert_equals(score(["A♦", "A♠"]), 12)
assert_equals(score(["10♦", "3♠", "10♣"]), 23)
assert_equals(score(["A♦", "A♠", "10♣"]), 12)

puts "If you get here, all tests passing..."
