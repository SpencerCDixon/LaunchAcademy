# 1. Get input for amount due.
# 2. Get input for how much cash customer gives James.
# 3. If cash is not not enough, propmts error and exits
# 4. Displays cash back and what time transaction occured.

# Part 2
# 1. Cashier is prompted to supply price of each item
# 2. Program outputs subtotals until done entering prices
# 3. When done the program lists price of all subitems
require 'pry'

items = []


puts "What is the sale price?"
sale_price = gets.chomp

until sale_price =~ /^d/i
  items << sale_price.to_f
  puts "Subtotal: $#{items.inject{|sum,n| sum + n}}"
  puts "What is the sale price?"
  sale_price = gets.chomp
end

subtotal = items.inject{|sum,n| sum + n}

puts "Here are your item prices:"
items.each do |item|
  puts item
end

puts "What is the amount tendered?"
cash_given = gets.chomp.to_f

if cash_given < subtotal
  puts "WARNING: Customer still owes $ #{"%.2f" % (subtotal - cash_given)}!"
  exit
end


change = cash_given - subtotal
puts
puts "===Thank You!==="
puts "The total change due is $#{"%.2f" % change.to_f}" unless cash_given == subtotal
puts
puts Time.now.strftime("%Y/%m/%d %H:%M%p")
puts "================"
