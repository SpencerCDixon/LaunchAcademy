class Person
  attr_reader :first_name, :last_name, :full_name
  def initialize(first, last)
    @first_name = first
    @last_name = last
    @full_name = first + ' ' + last
  end
end
