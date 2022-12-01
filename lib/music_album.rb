require_relative './item'

class MusicAlbum < Item
  attr_accessor :only_spotify, :name

  def initialize(date, only_spotify, name)
    super(date)
    @only_spotify = only_spotify
    @name = name
  end

  def can_be_archived?
    archived = super
    return true if archived && only_spotify

    false
  end
end
