def uniques(list)
  array = list.split(',')
  unique_array = array & array
  unique_array.join(',')
end
