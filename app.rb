require_relative 'person'
require_relative 'book'
require_relative 'student'
require_relative 'rental'
require_relative 'classroom'
require_relative 'teacher'

class App
  attr_accessor :people, :books, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'No books record'
    else
      puts 'Listing all books:'
      @books.each do |my_book|
        puts "#{my_book.title} by #{my_book.author}"
      end
    end
  end

  def create_book
    puts 'Enter Book Details'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    my_book = Book.new(title, author)
    @books << my_book
    puts 'Book created successfully'
  end

  def list_people
    if @people.empty?
      puts 'No people records found'
    else
      @people.each do |person|
        if person.is_a?(Student)
          puts "[Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        elsif person.is_a?(Teacher)
          puts "[Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def create_person
    print 'Do you want to create a student 1 or a teacher 2 ?[Input the Number]: '
    num_type = gets.chomp.to_i
    if num_type == 1
      create_student
    elsif num_type == 2
      create_teacher
    else
      puts 'Invalid person type'
      nil
    end
  end

  def create_student
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp
    puts 'Parent permission ? (Y/N): '
    parent_permission = gets.chomp.downcase == 'y'
    student = Student.new(age: age, name: name, parent_permission: parent_permission)
    @people << student
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'Enter Teacher details: '
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization: specialization, age: age, name: name)
    @people << teacher
    puts 'Person created successfully'
  end

  # Rental create
  def create_rental
    if @books.empty?
      puts 'Book record not found'
    elsif @people.empty?
      puts 'Person record not found'
    else
      selected_book = select_book
      selected_person = select_person
      date = the_rental_date

      rental = Rental.new(date, @books[selected_book], @people[selected_person])

      @rentals << rental
      puts 'Rental created successfully'
    end
  end

  def select_book
    puts 'Select a book from the following list by number:'
    @books.each_with_index do |book, index|
      puts "#{index} Title: \"#{book.title}\", Author: #{book.author}"
    end
    gets.chomp.to_i
  end

  def select_person
    puts 'Select a person from the following list by number (not id):'
    @people.each_with_index do |person, index|
      puts "#{index} Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    gets.chomp.to_i
  end

  def the_rental_date
    print 'Enter rental date: '
    gets.chomp
  end

  def list_rentals_for_person
    if @rentals.empty?
      puts 'Rental not found'
    else
      print 'Enter person ID: '
      person_id = gets.chomp.to_i

      rentals_found = false
      puts 'Rentals Details:'
      @rentals.each do |rental|
        next unless rental.person.id == person_id

        rentals_found = true
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end

      puts 'No rentals found for the given person' unless rentals_found
    end
  end
end
