require 'json'

movie_data = JSON.parse(File.read('in_theaters.json'))
sorted_by_rating = movie_data["movies"].sort_by do |movie|
  (movie["ratings"]["critics_score"] + movie["ratings"]["audience_score"]) / 2
end



puts "In Theaters Now:\n\n "

sorted_by_rating.reverse.each do |movie|
   puts "#{(movie["ratings"]["critics_score"] + movie["ratings"]["audience_score"]) / 2 } #{movie["title"]} (#{movie["mpaa_rating"]}) "
end
