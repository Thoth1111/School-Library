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
    @books.each { |book| puts book }
  end

  def list_persons
    @persons.each { |person| puts person }
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
    @persons.push(person)
    puts 'Person created successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp
    puts 'Author:'
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end
end
