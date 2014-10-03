
require 'pry'

def schedule_tournament(names)
  tournament = []
  round = []
  n = names.length
  round_count = (n-1)

  # n=0

  # while n < round_count

  round_count.times do

    # while names.length > 0
    #   round << names.pop(2)
    # end

    x =0
    y=-1
    while x < n/2
      round << [names[x], names[y]]
      binding.pry
      x+=1
      y-=1
    end

    # create a z variable that increments by 1 and creates the by

  tournament << round
  round = []

  placeholder = names.pop
  names.rotate!
  names << placeholder
  binding.pry

  # n+=1

  end

  tournament
end


schedule_tournament(['Julian', 'Ricky', 'Bubbles'])
