def average(grades)
  grades.map! {|num| num.to_i}
  grades.inject(0) {|sum, n| sum += n} / grades.size unless grades.size == 0
end


puts 'Enter grades (one per line, type "done" on a new line when finished):'
grades = []
grade = gets.chomp

while grade.downcase != "done"
  if grade.match(/^\d{1,3}$/)
    grades << grade
  else
    puts "Pick number 1-100"
  end
  grade = gets.chomp
end

if average(grades) == nil
  puts "failed"
  exit
end

if average(grades) >= 60
  puts "passed"
else
  puts "failed"
end
