require_relative './person'
require_relative './classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom, name: 'unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    classroom.student.push(self) unless classroom.include?(self)
  end

  def play_hookey
    '¯(ツ)/¯'
  end
end
