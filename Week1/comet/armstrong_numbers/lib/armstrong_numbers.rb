def armstrong_number? (number)
  array = number.to_s.split('')
  len = array.length
  answer = 0
  array.each do |x|
    answer += (x.to_i**len)
  end
    return answer == number
end
