class Book
  attr_accessor :author, :title, :rentals

  def initialize(title, author, _rentals)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals << rental
  end
end
