require 'json'
require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  attr_accessor :persons, :books, :rentals

  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def list_books
    if @books.empty?
      puts 'No books available'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end

  def list_persons
    if @persons.empty?
      puts 'No one here'
    else
      @persons.each_with_index do |person, index|
        if person.instance_of?(Teacher)
          puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        elsif person.instance_of?(Student)
          puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)? [input the number]:'
    type = gets.chomp
    case type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid type selection (student/teacher)'
    end
  end

  def create_student
    puts 'Name:'
    name = gets.chomp
    puts 'Age:'
    age = gets.chomp
    puts 'Has parent permission? [y/n]:'
    consent = gets.chomp.downcase
    parent_permission = consent == 'y'
    puts 'Classroom:'
    classroom = gets.chomp
    @persons.push Student.new(age: age, name: name, parent_permission: parent_permission, classroom: classroom)
    puts 'Person created successfully'
  end

  def create_teacher
    puts 'Age:'
    age = gets.chomp
    puts 'Name:'
    name = gets.chomp
    puts 'Specialization:'
    specialization = gets.chomp
    parent_permission = true
    @persons.push Teacher.new(age: age, name: name, specialization: specialization,
                              parent_permission: parent_permission)
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

  def create_rental
    puts 'select a book from the following list by number:'
    list_books
    bk_index = gets.chomp.to_i
    rented_book = @books[bk_index]
    puts 'select a person from the following list by number (not id)'
    list_persons
    person_index = gets.chomp.to_i
    renter = @persons[person_index]
    puts 'Date (YYYY-MM-DD):'
    date = gets.chomp
    if renter.can_use_services?
      @rentals.push Rental.new(date, rented_book, renter)
      puts 'Rental created successfully'
    else
      puts 'person lacks borrow permissions'
    end
  end

  def person_rentals
    puts 'ID of person:'
    renter_id = gets.chomp
    renter = @persons.select { |person| person.id == renter_id.to_i }
    if renter.empty?
      puts 'No rentals found'
    else
      renter.first.rentals.map do |rental|
        puts "#{rental.date}, Book: #{rental.book.title}, by #{rental.book.author}"
      end
    end
  end

  def save_data
    book_data = JSON.generate(@books)
    people_data = JSON.generate(@persons)
    rental_data = JSON.generate(@rentals)
    File.write('./saved/books.json', book_data)
    File.write('./saved/people.json', people_data)
    File.write('./saved/books.json', rental_data)
  end
end
