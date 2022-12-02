require_relative '../app'
class Start
  def initialize
    @app = App.new
    prompt
  end

  def prompt
    loop do
      display_options
      option = enter_input

      if option.to_i.zero?
        puts 'Thank you for using our app, see again👋'
        break
      end

      @app.run(option)
    end
  end

  def display_options
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all labels'
    puts '6. List all authors'
    puts '7. Add a book'
    puts '8. Add a music album'
    puts '9. Add a game'
    puts '0. Exit'
  end

  def enter_input
    print 'Enter a number: '
    option = gets.chomp
    while option.nil? || option.to_i.negative? || option.to_i >= 11
      puts 'Please enter a number between 1 and 10!'
      print 'Enter a number: '
      option = gets.chomp
    end
    option
  end
end
