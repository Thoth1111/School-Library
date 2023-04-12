require_relative '.person/'
require_relative '.student/'
require_relative '.teacher/'
require_relative '.book/'
require_relative './rental'

class App
  attr_accessor :persons, :books, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_books
    books.each { |book| puts book }
  end

  def list_persons
    persons.each { |person| puts person }
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]:'
    type = gets.chomp
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    if type == 1
      puts 'Has parent permission? [y/n]:'
      permission = gets.chomp
      parent_permission = false if permission == n
      person = Student.new(age, name, parent_permission)
    elsif type == 2
      puts 'Specialization:'
      person = Teacher.new(age, name, specialization)
    else
      puts 'Invalid type selection (parent/student)'
    end
    persons.push(person)
    puts 'Person created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'select a book from the following list by number:'
    books.each_with_index do |_book, _index|
      puts "{#{index}) Title: \"#{title}\", Author: #{author}}"
    end
    bk_index = gets.chomp
    rented_book = books[bk_index]
    puts 'select a person from the following list by number (not id)'
    persons.each_with_index do |person, _index|
      if person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{name}, ID: #{id}, Age: #{age}"
      elsif person.is_a?(Student)
        puts "#{index}) [Student] Name: #{name}, ID: #{id}, Age: #{age}"
      end
    end
    person_index = gets.chomp
    renting_person = persons[person_index]
    puts 'Date:'
    date = gets.chomp
    rentals.push(date, rented_book, renting_person)
    puts 'Rental created successfully'
  end
end
