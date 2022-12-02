require_relative './lib/game'
require_relative './lib/author'
require_relative './lib/persist_data'
require_relative './lib/music_album'
require_relative './lib/genre'
require_relative './lib/book'
require_relative './lib/label'
require_relative './lib/genre_additions'
require_relative './lib/music_album_additions'
require_relative './lib/games_data_preserved'
require_relative './lib/authors_data_preserved'
require_relative './lib/book_addtion'
require_relative './lib/label_addtion'
require 'json'
require 'date'

class App
  def initialize
    @data = PersistData.new
  end

  def run(option)
    option_list = {
      '1' => method(:display_books),
      '2' => method(:display_music_albums),
      '3' => method(:display_games),
      '4' => method(:display_genres),
      '5' => method(:display_labels),
      '6' => method(:display_authors),
      '7' => method(:create_book),
      '8' => method(:create_music_album),
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
    @data.write_date('games.json', games_json, 'Successfuly create game! ')
    create_author
  end

  def display_games
    games = @data.read_date('games.json')
    puts 'No record' if games.size.zero?
    games.each do |game|
      game_list = JSON.parse(game, create_additions: true)
      print "Game publish date  #{game_list.publish_date} Game multiplayer  #{game_list.multiplayer} "
      print "Game last played at  #{game_list.last_played_at} "
      puts
    end
    puts '=' * 50
  end

  def create_author
    puts 'Enter the author first name:'
    first_name = gets.chomp
    puts 'Enter the author last name:'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    authors_json = JSON.generate(author)
    @data.write_date('authors.json', authors_json, 'Author created successfuly')
  end

  def display_authors
    authors = @data.read_date('authors.json')
    puts 'No record' if authors.size.zero?
    authors.each do |author|
      author_list = JSON.parse(author, create_additions: true)
      print "First Name  #{author_list.first_name} Last Name  #{author_list.last_name} "
      puts
    end
    puts '=' * 50
  end

  def create_music_album
    print 'Enter album name '
    name = gets.chomp
    print 'Enter album genre name: '
    gener_name = gets.chomp
    print 'Enter publication date: as YYYY-MM-DD: '
    date = gets.chomp
    date_parsed = Date.parse(date)
    only_spotify = reander_boolean
    music_album = MusicAlbum.new(date_parsed, only_spotify, name)
    gener = Genre.new(gener_name)
    music_album_json = JSON.generate(music_album)
    @data.write_date('music_album.json', music_album_json)
    gener_json = JSON.generate(gener)
    @data.write_date('genre.json', gener_json, 'Music album created successfuly')
  end

  def reander_boolean
    puts 'Is this on spotify?'
    puts 'Enter 1 for True'
    puts 'Enter 0 for False'
    op = gets.chomp.to_i
    return true if op == 1
    return false if op.zero?

    return if [1, 0].include?(op)

    puts 'Please Enter valid input'
    reander_boolean
  end

  def display_music_albums
    albums = @data.read_date('music_album.json')
    puts 'No record' if albums.size.zero?

    albums.each do |album|
      music_album = JSON.parse(album, create_additions: true)
      print "Name: #{music_album.name}  Publication date: #{music_album.publish_date}"
      print "Only spotify: #{music_album.only_spotify}"
      puts
    end
    puts '=' * 50
  end

  def display_genres
    genre = @data.read_date('genre.json')
    puts 'No record' if genre.size.zero?
    genre.each do |gen|
      genre_list = JSON.parse(gen, create_additions: true)
      puts "Genre Name: #{genre_list.name}"
    end
    puts '=' * 50
  end

  def create_book
    puts 'Add Publisher:'
    publisher = gets.chomp
    puts 'Add Cover State (good or bad):'
    cover_state = gets.chomp
    print 'Add publication date: as YYYY-MM-DD: '
    date = gets.chomp
    puts 'Add Label Title: '
    title = gets.chomp
    puts 'Add Color: '
    color = gets.chomp
    publish_date = Date.parse(date)

    books = Book.new(publisher, cover_state, publish_date)
    label = Label.new(title, color)

    book_json = JSON.generate(books)
    @data.write_date('books.json', book_json)

    label_json = JSON.generate(label)
    @data.write_date('label.json', label_json, 'Book created successfuly')
  end

  def display_books
    books = @data.read_date('books.json')
    puts 'You have no books yet' if books.size.zero?

    books.each do |book|
      published_book = JSON.parse(book, create_additions: true)
      print "publisher: #{published_book.publisher} cover state: #{published_book.cover_state} "
      print " Publication date: #{published_book.publish_date}"
      puts
    end
    puts '=' * 50
  end

  def display_labels
    labels = @data.read_date('label.json')
    puts 'You have no label yet' if labels.size.zero?

    labels.each do |label|
      assigned_label = JSON.parse(label, create_additions: true)
      print "Title: #{assigned_label.title} Color: #{assigned_label.color} "
      puts
    end
    puts '=' * 50
  end
end
