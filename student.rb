require_relative 'person'

class Student < Person
  def initialize(age, parent_permission, classroom)
    super(age, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
