require 'csv'
require 'pry'

counts = {}

puts "Top 10 Males, Females, or All?"
answer = gets.chomp

if answer =~ /^a/i

CSV.foreach('baby_names.csv', headers: true) do |row|
   count = row["Count"]
   row.each do |key, value|
     if key == "First Name"
       unless counts.has_key?(value)
         counts[value] = 0
       end
       counts[value] = counts[value] + count.to_i
     end
   end
end

elsif answer =~ /^f/i
  CSV.foreach('baby_names.csv', headers: true) do |row|
    row.delete_if{row["Sex"] == "M"}
    count = row["Count"]
       row.each do |key, value|
         if key == "First Name"
           unless counts.has_key?(value)
             counts[value] = 0
           end
           counts[value] = counts[value] + count.to_i
         end
       end

  end

else
  CSV.foreach('baby_names.csv', headers: true) do |row|
    row.delete_if{row["Sex"] == "F"}
    count = row["Count"]
       row.each do |key, value|
         if key == "First Name"
           unless counts.has_key?(value)
             counts[value] = 0
           end
           counts[value] = counts[value] + count.to_i
         end
       end

  end
end

# Print out the sorted files
sorted = counts.sort_by {|key, value| value}.reverse.first(10)
sorted.each do |key,value|
  puts "#{key}: #{value}"
end
