require_relative './person'

class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    person.rental << self
    @book = book
    book.rentals << self
  end
end
