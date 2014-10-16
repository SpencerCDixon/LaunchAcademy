require 'csv'
require 'pry'

def display_scores(csv_file)
  counter = 0
  complete = ["Mini Golf Scores", "\n"]
  CSV.foreach(csv_file, headers: true) do |row|
    counter += 1
    total = 0
    # [1..9].to_a.each do |num|
      # total += row[num]
    # end
    complete << "#{counter}. #{row[:name]} with #{total}"
  end

  complete.each {|l| puts l}
end
