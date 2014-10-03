class Student
  attr_accessor :first_name, :last_name, :grades

  def initialize(first_name, last_name, grades)
    @first_name = first_name
    @last_name = last_name
    @grades = grades
  end

  def full_name
    first_name + ' ' + last_name
  end

  def grade_average
    if grades.size > 0
    grades.inject(0){|sum, num| (sum += num).to_f} / grades.size
    else
    0
    end
  end

  def letter_grade
    case
    when grade_average >= 90
      "A"
    when grade_average >= 80
      "B"
    when grade_average >= 70
      "C"
    when grade_average >= 60
      "D"
    else
      "F"
    end
  end

  def to_s
    "#{full_name}, #{letter_grade} (#{grade_average})"
  end

  def passed?
    if letter_grade == "F"
      false
    else
      true
    end
  end

end
