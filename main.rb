require_relative './src/app'
require_relative './src/selector'

def main
  menu = 'Please choose an option by entering a number:
    1 - List all books
    2 - List all people
    3 - Create a person
    4 - Create a book
    5 - Create a rental
    6 - List all rentals for a given person id
    7 - Exit'

  app = App.new
  selector = Selector.new(app)
  while menu
    puts menu
    option = gets.chomp.to_i
    selector.selected(option)
  end
end

main
