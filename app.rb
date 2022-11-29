
class App 
  def initialize
    @books = []
    @labels = []
    @albums = []
    @genres = []
    @authors = []
    @games = []
    @sources = []
  end

  def run(option)
    case option
    when 1
      display_books
    when 2
      display_music_albums
    when 3
      display_genres
    when 4
      display_labels
    when 5
      list_source
    when 6
      create_book
    when 7
      create_music_album
    when 8
      create_game
    when 9
      display_author
    when 10
      display_game
    else
         puts 'Thank you for using our app, see again👋'
    end
  end
end




