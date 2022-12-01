require_relative './lib/game'
require_relative './lib/author'
require_relative './lib/games_data_preserved'
require_relative './lib/authors_data_preserved'
require_relative './persist_data'
require 'json'
require 'date'

class App
  def initialize
    @data = PersistData.new
  end

  def run(option)
    option_list = {
      # '1' => method(:display_books),
      # '2' => method(:display_music_albums),
      '3' => method(:display_games),
      # '4' => method(:display_genres),
      # '5' => method(:display_labels),
      '6' => method(:display_authors),
      # '7' => method(:create_book),
      # '8' => method(:create_music_album),
      '9' => method(:create_game)
    }
    option_list[option].call
  end

  def create_game
    print 'Enter publication date: as YYYY-MM-DD: '
    date = gets.chomp
    date_parsed = Date.parse(date)

    puts 'Enter the game multiplayer:'
    multiplayer = gets.chomp
    puts 'Enter the game last played at:'
    last_played_at = gets.chomp
    game = Game.new(date_parsed, multiplayer, last_played_at)
    games_json = JSON.generate(game)
    @data.write_date('games.json', games_json)
    create_author

    puts 'Game created successfully!'
  end

  def display_games
    games = @data.read_date('games.json')
    puts '=' * 85
    puts 'No record' if games.size.zero?
    games.each do |game|
      game_list = JSON.parse(game, create_additions: true)

      print "Game publish date  #{game_list.publish_date} "
      print "Game multiplayer  #{game_list.multiplayer} "
      print "Game last played at  #{game_list.last_played_at} "
      puts
    end
    puts '=' * 85
  end

  def create_author
    puts 'Enter the author first name:'
    first_name = gets.chomp
    puts 'Enter the author last name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    authors_json = JSON.generate(author)
    @data.write_date('authors.json', authors_json)
    puts 'Author created successfully!'
  end

  def display_authors
    authors = @data.read_date('authors.json')
    puts '=' * 30
    puts 'No record' if authors.size.zero?
    authors.each do |author|
      author_list = JSON.parse(author, create_additions: true)
      print "First Name  #{author_list.first_name} "

      print "Last Name  #{author_list.last_name} "

      puts
    end
    puts '=' * 30
  end
end
