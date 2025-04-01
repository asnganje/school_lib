require_relative 'app'

def main
  app = App.new
  puts 'Welcome to School Library App!'
  count = 0

  loop do
    display_menu
    break if handle_option(gets.chomp.to_i, app, count)
  end
end

def display_menu
  puts "\nChoose an option (1-7):"
  puts '1. List books  2. List people  3. Create person  4. Create book'
  puts '5. Create rental  6. List rentals  7. Exit'
end

def handle_option(option, app, count)
  actions = { 1 => :list_all_books, 2 => :list_all_people, 3 => :create_a_person,
              4 => :create_a_book, 5 => :create_a_rental, 6 => :list_persons_rentals }

  if option == 7
    puts 'Exiting... Bye!'
    return true
  end

  unless actions[option]
    count += 1
    puts count == 3 ? 'Max attempts reached!' : 'Invalid option, try again!'
    return false
  end

  app.send(actions[option])
  false
end

main
