require 'pry'

# 1. Get input for which coffee selection
# 2. Asking how many of that particular coffee
# 3. Showing a subtotal
# 4. Repeat steps 2,3
# 5. Until selection == 4
# 6. Display sale is complete with what is in that sale
# 7. Get the amount tendered
# 8. Provide receipt with thank you and date/time

require "csv"
products = []
num = 0
total = 0.0
number_of_light = 0
number_of_medium = 0
number_of_dark = 0

CSV.foreach("products.csv",headers:true) do |row|
  products << {sku: row["SKU"], name: row["name"], whole_sale: row["wholesale_price"], retail_price: row["retail_price"]}
end

######## Methods ##########
def make_selection
  puts "Make a selection"
  selection = gets.chomp.to_i
    if selection < 1 || selection > 4
      puts "Please put number in between 1 and 4"
      selection = gets.chomp.to_i
    end
  selection
end

def quantity_of_selection
  puts "How many?"
  quantity = gets.chomp
end

def calculate_subtotal(make_selection,quantity_of_selection,products)
  product_price = products[make_selection.to_i - 1][:retail_price].to_f
  subtotal = product_price * quantity_of_selection.to_f
  subtotal
end

def tendered
  puts "What is the amount tendered?"
  tendered = gets.chomp.to_f
end

def check_tendered(tender_amount,total)
  if tender_amount < total
    puts "WARNING: Customer still owes $#{total.to_f - tender_amount.to_f}"
    exit
  end
end

def receipt(tendered,total)
  puts "===Thank You!==="
  puts "The total change is: $#{total.to_f - tendered.to_f}"
  puts Time.now.strftime("%Y/%m/%d %H:%M%p")
  puts "================"
end

def show_coffee_selections(products,num)
  products.each do |coffee_type|
  num += 1
    puts "#{num}. Add item - $#{coffee_type[:retail_price]} - #{coffee_type[:name]}"
  end
  puts "4. Complete Sale\n\n"
end


######### Program  #########
puts "Welcome to Jame's Coffee Emporium\n\n"

show_coffee_selections(products,num)


current_selection = make_selection

until current_selection == 4
  current_quantity = quantity_of_selection

  if products[current_selection.to_i - 1][:name] == "Light"
      number_of_light += current_quantity.to_i
  elsif products[current_selection.to_i - 1][:name] == "Medium"
      number_of_medium += current_quantity.to_i
  elsif products[current_selection.to_i - 1][:name] == "Bold"
      number_of_dark += current_quantity.to_i
  end

  subtotal = calculate_subtotal(current_selection,current_quantity,products)
  total = subtotal.to_f + total
  puts "Subtotal: #{total}"
  current_selection = make_selection
end

puts "===Sale Complete==="
puts "$#{products[0][:retail_price].to_f * number_of_light.to_f} - #{number_of_light} Light"
puts "$#{products[1][:retail_price].to_f * number_of_medium.to_f} - #{number_of_medium} Medium"
puts "$#{products[2][:retail_price].to_f * number_of_dark.to_f} - #{number_of_dark} Bold"
amount_tendered = tendered
check_tendered(amount_tendered,total)
receipt(amount_tendered,total)


# Writes transaction to a new CSV file.

CSV.open("transactions.csv","ab") do |csv|
  csv << ["SKU", "Quantity", "Total"]
  csv << ["#{products[0][:sku]}","#{number_of_light}","#{products[0][:retail_price].to_f * number_of_light.to_f}"]
  csv << ["#{products[1][:sku]}","#{number_of_medium}","#{products[1][:retail_price].to_f * number_of_medium.to_f}"]
  csv << ["#{products[2][:sku]}","#{number_of_dark}","#{products[2][:retail_price].to_f * number_of_dark.to_f}"]

end
