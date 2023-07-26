require_relative 'nameable'
require_relative 'trimmer_decorator'
require_relative 'capitalize_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    super()
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(1, 22, 'Maximilianus')
puts person.correct_name # Output: Maximilianus

capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name # Output: Maximilianus

capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name # Output: Maximilian
