require_relative './lib/persist_data'
require_relative './lib/music_album'
require_relative './lib/genre'
require_relative './lib/genre_additions'
require_relative './lib/music_album_additions'
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
      #  '1' => display_books,
      '2' => method(:display_music_albums),
      '4' => method(:display_genres),
      # '4' => display_labels, '5' => list_source,
      # '6' => create_book,
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

    puts date_parsed
    puts only_spotify

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
end
