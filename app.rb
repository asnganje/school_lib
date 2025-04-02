require 'json'

class App
  DATA_FILES = {
    books: 'books.json',
    people: 'people.json',
    rentals: 'rentals.json'
  }.freeze
  def initialize
    @books = load_data(:books)
    @people = load_data(:people)
    @rentals = load_data(:rentals)
  end

  def list_all_books
    if @books.empty?
      puts 'No books available'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}: #{book.title} by #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'No people found!'
    else
      @people.each_with_index do |person, index|
        puts "#{index + 1}: [#{person[:type]}] #{person[:name]}, Age: #{person[:age]}"
      end
    end
  end

  def create_a_person
    print 'Do you want to create a student(1) or a teacher(2) [choose a number]'
    type = gets.chomp.to_i
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    id = @people.length + 1
    case type
    when 1
      print 'Has parent permission? [Y/N]'
      permission = gets.chomp.downcase == 'y'
      @people << { type: 'Student', name: name, age: age, id: id, parent_permission: permission }
    when 2
      print 'Specialization'
      specialization = gets.chomp
      @people << { type: 'Teacher', name: name, age: age, id: id, specialization: specialization }
    else
      print 'Invalid option'
      nil
    end
  end

  def create_a_book
    print 'Enter title'
    title = gets.chomp
    print 'Enter author'
    author = gets.chomp
    @books << { title: title, author: author }
    print 'Book created successfully'
  end

  def create_a_rental
    if @books.empty || @people.empty?
      puts 'Books and people must exist before creating a rental'
      return
    end

    puts 'Select a book number'
    list_all_books
    book_idx = gets.chomp.to_i - 1

    puts 'Select a person number'
    list_all_people
    person_idx = gets.chomp.to_i - 1

    print 'Date (YYYY-MM-DD): '
    date = gets.chomp
    @rentals << { date: date, book: @books[book_idx], person: @people[person_idx] }
    print 'Rental created successfully'
  end

  def list_persons_rentals
    print "Enter person's ID"
    gets.chomp.to_i
    rentals = @rentals.select { |rental| rental[:person][:id] }

    if rentals.empty?
      puts 'No rentals found for this person'
    else
      rentals.each { |rental| puts "#{rental[:date]}: #{rental[:book][:title]} by #{rental[:book][:author]}" }
    end
  end

  def save_data
    File.write(DATA_FILES[:books], JSON.pretty_generate(:books))
    File.write(DATA_FILES[:people], JSON.pretty_generate(:people))
    File.write(DATA_FILES[:rentals], JSON.pretty_generate(:rentals))
    puts 'Data saved successfully!'
  end

  private

  def load_data(type)
    file_path = DATA_FILES[type]
    return [] unless File.exist?(file_path)

    JSON.parse(File.read(file_path), symbolize_names: true)
  rescue JSON::ParseError
    puts "Error loading #{file_path}, resetting data"
    []
  end
end
