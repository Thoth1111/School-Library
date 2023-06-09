require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age:, classroom:, parent_permission:, name: 'unknown')
    super(name: name, parent_permission: parent_permission, age: age)
    @classroom = classroom
  end

  def play_hookey
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
