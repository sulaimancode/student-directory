# let's put all students inot an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  #get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student has to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from user
    name = gets.chomp
  end
  # return the array of students
  students
end


def print_header
puts "The students of Villians Academy"
puts "-------------"
end

def print(students)
  students.each_with_index do |student, i|
    puts "#{i.to_i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
puts "Overall, we have #{students.count} great students"
end
#nothing happend until we call methods
students = input_students
print_header
print(students)
print_footer(students)
