#!/usr/bin/env ruby
require_relative './app'

def main
  puts 'Please choose an option by entering a number:\n
    1 - List all books\n
    2 - List all people\n
    3 - Create a person\n
    4 - Create a book\n
    5 - Create a rental\n
    6 - List all rentals for a given person id\n
    7 - Exit'

  app = App.new
  selected = gets.chomp
  exit if selected == '7'

  run(selected, app)
end

def run(selected, app)
  case selected
  when '1'
    app.list_books
  when '2'
    app.list_persons
  when '3'
    app.create_person
  when '4'
    app.create_book
  when '5'
    app.create_rental
  when '6'
    app.person_rentals
  else
    puts 'Invalid input. Please try again'
  end
end

main
