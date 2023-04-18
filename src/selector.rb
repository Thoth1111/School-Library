class Selector
  def initialize(app)
    @app = app
  end

  def selected(option)
    case option
    when 1
      @app.list_books
    when 2
      @app.list_persons
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.person_rentals
    when 7
      @app.save_data
      exit
    else
      puts 'Invalid input. Please try again'
    end
  end
end
