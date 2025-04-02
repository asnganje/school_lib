require_relative '../../nameable'

describe Nameable do
  describe 'runs correct name method' do
    it 'it should raise an error' do
      expect { Nameable.new.correct_name }.to raise_error(NotImplementedError)
    end
  end
end
