# YOUR CODE HERE
#- If the number is divisible by 3, print out the word "Fizz" instead.
#- If the number is divisible by 5, print out the word "Buzz" instead.
#- If the number is divisible by 3 and 5, print out the word "FizzBuzz" instead.

numbers = (1..100).to_a

output = numbers.map do |number|
  if number % 3 == 0 && number % 5 == 0
     "FizzBuzz"
  elsif number % 3 == 0
     "Fizz"
  elsif number % 5 == 0
     "Buzz"
  else
     number
  end
end

output.each{|word| puts word}
