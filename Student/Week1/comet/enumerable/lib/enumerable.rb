require 'pry'
def map(collection, &block)
  result = []
  collection.each do |x|
    result << yield(x) 
  end
  result
end

def filter(collection, &block)
  result = []
  collection.each do |x|
    if yield(x)
      result << x
    end
  end
  result
end

def any?(collection, &block)
  collection.each do |x|
    if yield(x)
      return true
    end
  end
  false
end

def reduce(collection, initial = nil)
  result = initial
  new_collection = collection.dup
  if initial == nil
    result = new_collection.shift
  end
  new_collection.each do |x|
    result = yield(result, x)
  end
  result
end
