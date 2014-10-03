scores = [75, 100, 85, 65, 84, 87, 95]

# Average score method
# Lowest score method
# Highest score method

# no max, min, or sort functions allows

def average(array)
  array.inject {|sum,n| sum + n} / array.size
end


def min(array)
  smallest = array.pop
  array.each do |grade|
    if grade < smallest
      smallest = grade
    end
  end
  smallest
end


def max(array)
  largest = array.pop
  array.each do |grade|
    if grade > largest
      largest = grade
    end
  end
  largest
end
