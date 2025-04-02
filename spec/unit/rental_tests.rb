require_relative '../../rental'
require_relative '../../book'
require_relative '../../person'

describe Rental do
  let!(:book) {Book.new( "First Book", "Abdul")}
  let!(:person) {Person.new(2, 30)}
  let!(:rental) {Rental.new("2025-04-03", book, person)}
  describe "validates instance attributes" do
    it "should validate instance of Rental" do
      expect(rental).to be_an_instance_of(Rental)
    end 
  end

  describe "validates associations" do
    it "should associate a book with a rental" do
      expect(rental.book).to eq(book)
    end

    it "should associate person with a rental" do
      expect(rental.person).to eq(person)
    end
  end
end