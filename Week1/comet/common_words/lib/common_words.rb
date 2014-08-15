
def most_common(string)
  occurance = {}
  words = string.split('')
  words.each do |word|
    if occurance.has_key?(word)
      occurance[word] = occurance[word] + 1
    else
      occurance[word] = 1
    end
  end
  occura
end
