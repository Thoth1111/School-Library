require_relative './rental'

class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def rent_book(rental)
    @rentals.push(rental)
  end
end
