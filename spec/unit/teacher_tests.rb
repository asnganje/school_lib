require_relative '../../teacher'

describe Teacher do
  let!(:teacher) {Teacher.new("Teacher", 30)}
  describe "Validate attributes setup" do
    it "should check instance validity" do
      expect(teacher).to be_an_instance_of(Teacher)
    end
  end

  describe "display of can use services" do
    it "should return a boolean" do
      result = teacher.can_use_services?
      expect(result).to be(true)
    end
  end
end