require_relative '../../student'

describe Student do
  let!(:student) { Student.new(25) }
  describe 'check instance validity' do
    it 'should ensure instance validity' do
      expect(student).to be_an_instance_of(Student)
    end
  end

  describe 'return student age' do
    it 'should return student age' do
      result = student.age
      expect(result).to be_an(Integer)
    end
  end

  describe 'display classroom type' do
    it 'should return nil or String type' do
      output = student.classroom
      expect(output).to be_a(String).or be(nil)
    end
  end

  describe 'display game played' do
    it 'displays type of game played by student' do
      game = student.play_hooky
      expect(game).to eq('¯\\(ツ)/¯')
    end
  end
end
