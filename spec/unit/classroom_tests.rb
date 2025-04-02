require_relative '../../classroom'
require_relative '../../student'

describe ClassRoom do
  let!(:classroom) { ClassRoom.new('Maths') }

  describe 'Validates instance attributes' do
    it 'should check and return instance validity' do
      expect(classroom).to be_an_instance_of(ClassRoom)
    end
  end

  describe 'adds student to classroom' do
    it 'should add student to a classroom' do
      student = Student.new('Ozil')
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end
end
