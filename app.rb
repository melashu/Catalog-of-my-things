require_relative './lib/persist_data'
require_relative './lib/music_album'
require_relative './lib/genre'
require_relative './lib/genre_additions'
require_relative './lib/music_album_additions'
require_relative './lib/book'
require_relative './lib/book_addtion'
require_relative './lib/label'
require_relative './lib/label_addtion'
require 'date'
require 'json'
class App
  def initialize
    @books = []
    @labels = []
    @albums = []
    @genres = []
    @authors = []
    @games = []
    @sources = []
    @data = PersistData.new
  end

  def run(option)
    option_list = {
      '1' => method(:display_books),
      '2' => method(:display_music_albums),
      '4' => method(:display_genres),
      '5' => method(:display_labels),
      # '5' => list_source,
      '8' => method(:create_book),
      '9' => method(:create_music_album)
      # '8' => create_game,
      # '9' => display_author, '10' => display_game
    }

    option_list[option].call
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
    @data.write_date('genre.json', gener_json)
  end

  def reander_boolean
    puts 'Is this on spotify?'
    puts 'Enter 1 for True'
    puts 'Enter 0 for False'
    op = gets.chomp.to_i
    case op
    when 1
      true
    when 0
      false
    else
      puts 'Please Enter valid input'
      reander_boolean
    end
  end

  def display_music_albums
    albums = @data.read_date('music_album.json')
    puts '=' * 60
    puts 'No record' if albums.size.zero?

    albums.each do |album|
      music_album = JSON.parse(album, create_additions: true)
      print "Name: #{music_album.name} "
      print " Publication date: #{music_album.publish_date}"
      print "Only spotify: #{music_album.only_spotify}"
    end
    puts
    puts '=' * 60
  end

  def display_genres
    genre = @data.read_date('genre.json')
    puts '=' * 30
    puts 'No record' if genre.size.zero?
    genre.each do |gen|
      genre_list = JSON.parse(gen, create_additions: true)
      puts "Genre Name: #{genre_list.name}"
    end
    puts '=' * 30
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

    puts 'Book created successfully\n'

    book_json = JSON.generate(books)
    @data.write_date('books.json', book_json)

    label_json = JSON.generate(label)
    @data.write_date('label.json', label_json)
  end

  def display_books
    books = @data.read_date('books.json')
    puts '=' * 80
    puts 'You have no books yet' if books.size.zero?

    books.each do |book|
      published_book = JSON.parse(book, create_additions: true)
      print "publisher: #{published_book.publisher} "
      print "cover state: #{published_book.cover_state} "
      print " Publication date: #{published_book.publish_date}"
      puts
    end
    puts '=' * 80
  end

  def display_labels
    labels = @data.read_date('label.json')
    puts '=' * 80
    puts 'You have no label yet' if labels.size.zero?

    labels.each do |label|
      assigned_label = JSON.parse(label, create_additions: true)
      print "Title: #{assigned_label.title} "
      print "Color: #{assigned_label.color} "
      puts
    end
    puts '=' * 80
  end
end
