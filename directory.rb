@students = []
def input_students

    puts "Please enter the name of the student, or 'quit' to exit"
    #get the first name
    name = gets.delete("\n")
    name = "no name was given" if name.empty?
  if name != 'quit'
    puts "Enter student's cohort"
    cohort = gets.delete("\n").downcase
    cohort = "no cohort was given" if cohort.empty?
    months = %w(january february march april may june july august september october november december )
    months << "no cohort was given"
      while !months.include? cohort
        puts "Please type the correct cohort"
        cohort = gets.delete("\n").downcase
      end
    while name != 'quit' do
      # add the student has to the array
      @students << {name: name, cohort: cohort.gsub(/\s+/,"_").downcase.to_sym}
        if @students.count == 1
          puts "Now we have 1 student"
        else
          puts "Now we have #{@students.count} students"
        end
      # get another name from user
      puts "Enter name of another student, or 'quit' to exit."
      name = gets.chomp
      name = "no name was given" if name.empty?
        if name != 'quit'
      puts "Enter students cohort"
      cohort = gets.chomp.downcase
      cohort = "no cohort was given" if cohort.empty?
        while !months.include? cohort
          puts "Please type the correct cohort"
          cohort = gets.chomp.downcase
        end
      end
    end
  end
end


def print_header
puts "The students of Villians Academy".center(50)
puts "--------------------------".center(50)
end

def print_students_list
  @students.group_by { |student| student[:cohort] }.each { |key, value|
    puts "#{key.capitalize} cohort:"
    value.each {|v|
       puts v[:name]
        }
       puts "----------------------------" }
end

def print_footer
puts "Overall, we have #{@students.count} great students".center(50)
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end
#nothing happend until we call methods
interactive_menu
