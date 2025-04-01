require_relative 'person'
class Student < Person
  attr_reader :classroom

  def initialize(age, classroom = nil, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    self.classroom = classroom if classroom
  end

  def classroom=(classroom)
    return if @classroom == classroom

    @classroom&.students&.delete(self)
    @classroom = classroom
    classroom.add_student(self) unless classroom.nil? || classroom.students.include?(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
