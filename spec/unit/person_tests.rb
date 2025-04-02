require_relative '../../person'

describe Person do
  let!(:person) { Person.new(25, 2) }
  describe 'validates attributes' do
    it 'checks instance validity' do
      expect(person).to be_an_instance_of(Person)
    end
  end

  describe 'adds a rental to person' do
    it 'should add a rental to a person' do
      rental = { date: '2025-04-1', book: 'Choices', person: 'Abdul' }
      person.add_rental(rental)
      expect(person.rentals).to include(rental)
      expect(person.rentals.size).to eq(1)
    end
  end

  describe 'checks if can use services' do
    it 'should return a boolean' do
      result = person.can_use_services?
      expect(result).to be(true).or be(false)
    end
  end

  describe 'displays person name' do
    it "should return a string of person's name" do
      profile_name = person.correct_name
      expect(profile_name).to eq('Unknown')
    end
  end
end
