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
    option_list = { '1' => display_books, '2' => display_music_albums,
                    '3' => display_genres, '4' => display_labels, '5' => list_source,
                    '6' => create_book, '7' => create_music_album, '8' => create_game,
                    '9' => display_author, '10' => display_game }

    option_list[option].call
  end
end
