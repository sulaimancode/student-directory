# let's put all students inot an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
def print_header
puts "The students of Villians Academy"
puts "-------------"
end

def print(names)
  names.each do |name|
    puts name
  end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end
#nothing happend until we call methods
print_header
print(students)
print_footer(students)
