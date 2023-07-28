require_relative 'app'

class SchoolLibraryApp
  MENU_CHOICES = {
    1 => :list_books,
    2 => :list_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    7 => :quit
  }

  def initialize
    @school_library = App.new
  end

  def display_menu
    puts 'Welcome to the School Library App'
    puts 'Please choose an option by entering a number:'
    MENU_CHOICES.each do |number, description|
      puts "#{number}. #{description.capitalize}"
    end
  end

  def handle_choice(choice)
    action = MENU_CHOICES[choice]
    if action
      if action == :quit
        puts 'Thank you for using this app'
        exit
      else
        @school_library.public_send(action)
      end
    else
      puts 'Invalid option. Please try again.'
    end
  end

  def run
    loop do
      display_menu
      choice = gets.chomp.to_i
      handle_choice(choice)
      puts "\n"
    end
  end
end

def main
  school_library_app = SchoolLibraryApp.new
  school_library_app.run
end

main
