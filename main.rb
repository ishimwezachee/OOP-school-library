require_relative 'person'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require_relative 'teacher'
require_relative 'classroom'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def execute
    puts 'Welcome to School Library App!'

    loop do
      main_options
      print 'Please Select an Option to Proceed: '
      option = gets.chomp
      break if option == '7'

      option_output option
    end

    puts 'Thank you for using this app!'
  end

  def main_options
    puts
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts '*******************'
  end

  def option_output(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_by_person_id
    else
      puts 'Please enter a number between 1 and 7'
    end
  end

  def list_all_books
    puts 'There is no book. Please Add a Book!' if @books.length.zero?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    sleep 1
  end

  def list_all_people
    puts 'There is no person. Please Add a Person!' if @people.length.zero?
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    sleep 1
  end

  def create_person
    print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input.'
      sleep 1
      print 'Do you want to create a student (1) or teacher (2) [Input a number]: '
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    student = Student.new(age: age, name: name, parent_permission: parent_permission, classroom: @classroom)
    @people.push(student)

    puts 'Student created successfully'
    sleep 1
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(specialization: specialization, age: age, name: name)
    @people.push(teacher)

    puts 'Teacher created successfully'
    sleep 1
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)

    puts 'Book added successfully'
    sleep 1
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    book_i = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not ID)'
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    person_i = gets.chomp.to_i
    puts
    print 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @books[book_i], @people[person_i])
    @rentals.push(rental)
    puts 'Rental created successfully'
    sleep 1
  end

  def list_rentals_by_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
    sleep 1
  end
end

def main
  app = App.new
  app.execute
end

main