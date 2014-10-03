def sort_list(arr)
  list_array=arr.split(' ')
  list_array.map!{|num| num.to_f}
  rec_sort_list(list_array, [])
end

def rec_sort_list(list, sorted)

  if list.length <= 0
    return sorted.join(' ')
  end

  unsorted = []
  smallest = list.pop

    list.each do |num|
      if num < smallest
        unsorted << smallest
        smallest = num
      else
        unsorted << num
      end
    end

  sorted << smallest
  rec_sort_list(unsorted, sorted)
end
