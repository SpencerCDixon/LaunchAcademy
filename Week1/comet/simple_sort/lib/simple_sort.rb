def sort_list(list)
  unsorted = list.split(' ') # splits string into an array of numbers
  unsorted.map! {|var| var.to_f} # converts string numbers to integers


  swapped = false

  while !swapped
    swapped = false

  0.upto(unsorted.size-2) do |i|
    if unsorted[i] > unsorted[i + 1]
      unsorted[i], unsorted[i+1] = list[i+1], list[i]
      swapped = true
    end
  end
  end
unsorted

end

# unsorted.each do |number1|
#   unsorted.each do |number2|
#     if number1 > number2
#       sorted.push(number1)
#     else
#       sorted.insert(0,number1)
#     end
#   end
# end
