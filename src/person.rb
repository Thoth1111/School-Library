require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age:, parent_permission:, name: 'unknown')
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
    return true if of_age? || (instance_of?(Student) && @parent_permission)

    false
  end

  def rent_book
    @rentals.push(rental)
  end

  private

  def of_age?
    return true if age.to_i >= 18

    false
  end
end
