counts = {}

input = gets.chomp
words = input.split

words.each do |word|
  unless counts.has_key?(word)
    counts[word] = 0
  end
  counts[word] += 1
end

counts.each do |word, number|
  puts  "#{word} #{number}"
end
