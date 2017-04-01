@students = []
@months = %w(january february march april may june july august september october november december )
@months << "no cohort was given"
def typo
  while !@months.include? @cohort
    puts "Please type the correct cohort"
    @cohort = STDIN.gets.delete("\n").downcase
  end
end

def ask_and_gets_cohort
  puts "Enter students cohort"
  @cohort = STDIN.gets.chomp.downcase
  @cohort = "no cohort was given" if @cohort.empty? # assign default
end

def input_students

    puts "Please enter the name of the student, or 'quit' to exit"
    #get the first name
    @name = STDIN.gets.delete("\n")
    @name = "no name was given" if @name.empty?
  if @name != 'quit'
    ask_and_gets_cohort
    typo
    while @name != 'quit' do
      # add the student has to the array
      add_students_to_array
        if @students.count == 1
          puts "Now we have 1 student"
        else
          puts "Now we have #{@students.count} students"
        end
      # get another name from user
      puts "Enter name of another student, or 'quit' to exit."
      @name = STDIN.gets.chomp
      @name = "no name was given" if @name.empty?
        if @name != 'quit'
      ask_and_gets_cohort
      typo
      end
    end
  end
end

def add_students_to_array
  @students << {name: @name, cohort: @cohort.gsub(/\s+/,"_").downcase.to_sym}
end

def print_header
puts "The students of Villians Academy".center(50)
puts "--------------------------".center(50)
end

def print_students_list
  @students.group_by { |student| student[:cohort] }.each { |key, value|
    puts "#{key.capitalize} cohort:"
    puts ""
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
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
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
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    @name, @cohort = line.chomp.split(',')
    add_students_to_array
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    filename = "students.csv"
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end


#nothing happend until we call methods
try_load_students
interactive_menu
