require_relative './src/app'

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
  while menu
    puts menu
    selected = gets.chomp.to_i
    exit if selected == 7

    run(selected, app)
  end
end

def run(selected, app)
  case selected
  when 1
    app.list_books
  when 2
    app.list_persons
  when 3
    app.create_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.person_rentals
  else
    puts 'Invalid input. Please try again'
  end
end

main
