def max_number(numbers)
  if numbers == []
    return nil
  end
  return numbers.sort.pop
end
