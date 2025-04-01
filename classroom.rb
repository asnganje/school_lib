class ClassRoom
  attr_accessor :label, :students
  def initialize(label)
    @label = label
    @student = []
  end

  def add_student(student)
    unless @students.include?(student)
      @student << student
      student.classroom = self unless student.classroom == self
    end
  end
end