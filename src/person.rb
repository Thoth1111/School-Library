require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name: 'unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def can_use_services?
    return true if of_age? || @parent_permission

    false
  end

  def rent_book
    @rentals.push(rental)
  end

  private

  def of_age?
    return true if age >= 18

    false
  end
end
