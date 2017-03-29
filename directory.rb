
def input_students
  puts "Please enter the names of the students and their cohort on the next line"
  puts "To finish, type 'quit' and hit enter twice"
  # create an empty array
  students = []
  #get the first name
  name = gets.chomp
  name = "no name was given" if name.empty?

  cohort = gets.chomp.downcase
  cohort = "no cohort was given" if cohort.empty?
  months = %w(january february march april may june july august september october november december )
  months << "no cohort was given"
  while !months.include? cohort
    puts "Please type the correct cohort"
    cohort = gets.chomp.downcase
  end

  while name != 'quit' do
    # add the student has to the array
    students << {name: name, cohort: cohort.gsub(/\s+/,"_").downcase.to_sym}
    if students.count == 1
    puts "Now we have 1 student"
  else
    puts "Now we have #{students.count} students"
  end
    # get another name from user
    name = gets.chomp
    name = "no name was given" if name.empty?
    cohort = gets.chomp.downcase
    cohort = "no cohort was given" if cohort.empty?
    while !months.include? cohort
      puts "Please type the correct cohort"
      cohort = gets.chomp.downcase
    end
  end
  # return the array of students
  students
end


def print_header
puts "The students of Villians Academy".center(50)
puts "--------------------------".center(50)
end

def print(students)
  i = 0
  while i < students.count
    str = "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
    puts str.center(str.length + 15)
    i += 1
  end
end

def print_footer(students)
puts "Overall, we have #{students.count} great students".center(50)
end
#nothing happend until we call methods
students = input_students
if students.count > 0
print_header
print(students)
print_footer(students)
end
