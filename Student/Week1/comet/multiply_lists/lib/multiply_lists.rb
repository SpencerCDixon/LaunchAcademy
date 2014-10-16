def multiply_lists(lists)
  array = lists.split("|")

  list1 = array[0].split(" ")
  list2 = array[1].split(" ") 
  if list1.size == list2.size 
    final_answer = [] 
    iteration = 0..(list1.size - 1)

    iteration.each do |num|
     final_answer << (list1[num].to_i * list2[num].to_i)
    end
    final_answer.join(",").gsub(/,/,' ')
  else
    "Lists must be same length"
  end
end
