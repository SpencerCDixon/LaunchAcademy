require 'pry'

text = File.read('hamlet.txt') #Read from shakespear file

counts = {}

words = text.split
words.each do |word|
  unless counts.has_key?(word)
    counts[word] = 0
  end
  counts[word] += 1
end

organized = counts.sort_by {|word, count| count }.reverse
binding.pry
