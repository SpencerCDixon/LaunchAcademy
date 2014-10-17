require 'pry'
def most_common(string)
  occurance = {}
  words = string.downcase.gsub(/(,|!|-)/,' ').split(' ')
  words.each do |word|
    if occurance.has_key?(word)
      occurance[word] = occurance[word] + 1
    else
      occurance[word] = 1
    end
  end
  common_words = []
  max_value = occurance.values.max
  occurance.each do |k,v|
    if v == max_value
      common_words << k
    end
  end
  common_words
end
