require_relative '../../book'
describe Book do
  let!(:bk) { Book.new('First book', 'Abdul') }
  describe 'Validates attributes' do
    it 'should ensure attributes are valid' do
      expect(bk).to be_an_instance_of(Book)
    end
  end

  describe 'adds rental to book' do
    it 'should add rental to @rentals array' do
      rental = { person: 'Abdul', date: '2024-05-12', book: 'book' }
      bk.add_rental(rental)

      expect(bk.rentals).to include(rental)
      expect(bk.rentals.size).to eq(1)
    end
  end
end
