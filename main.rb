# main.rb
require_relative 'app'

school_library = App.new

loop do
  puts 'Welcome to the School Library App'
  puts 'Please choose an option by entering a number:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person (student/teacher)'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'

  choice = gets.chomp.to_i

  case choice
  when 1
    school_library.list_books
  when 2
    school_library.list_people
  when 3
    school_library.create_person
  when 4
    school_library.create_book
  when 5
    school_library.create_rental
  when 6
    school_library.list_rentals_for_person
  when 7
    puts 'Thank you for using this app'
    break
  else
    puts 'Invalid option. Please try again.'
  end

  puts "\n"
end
