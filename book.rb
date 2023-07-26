require_relative 'rental'
class Book
  attr_accessor :author, :title, :rentals

  def initialize(title, author, _rentals)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    @rentals << Rental.new(date, self, person)
  end
end
