def hex_to_decimal (hex_value)
  hex_array = hex_value.split('').reverse
  answer = 0
  hex_array.each_with_index do |d, i|
    case d.upcase
      when '1'..'9'
        d = d.to_i
      when 'A'
        d = 10
      when 'B'
        d = 11
      when 'C'
        d = 12
      when 'D'
        d = 13
      when 'E'
        d = 14
      when 'F'
        d = 15
    end

    answer += d*(16**i)
  end
  return answer
end
