require './nameable'

class Person < Nameable
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(age:, parent_permission: true, name: 'Unknown')
    @id = self.class.next_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services?
    of_age?(18) || @parent_permission
  end

  def correct_name
    @name
  end

  def self.next_id
    rand(1..1000)
  end

  def of_age?
    @age >= 18
  end

  private

  def add_rental(person, date = Date.today, book = self)
    Rental.new(date, book, person)
    @rentals << self unless @rentals.include?(self)
  end
end
