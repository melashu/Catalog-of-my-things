require_relative '../lib/genre'
require_relative '../lib/music_album'
require 'date'

describe MusicAlbum do
  before(:all) do
    @genre = Genre.new('jazz')
    @item1 = MusicAlbum.new(Date.parse('2001-02-03'), true, 'jazz')
    @item2 = MusicAlbum.new(Date.parse('2020-02-03'), false, 'ja')
  end
  context 'when testing method inside MusicAlbum class' do
    it 'genre should be an instance of Genre class' do
      @item1.genre = @genre
      expect(@item1.genre).to an_instance_of(Genre)
    end
    it 'can_be_archived? should return true' do
      expect(@item1.can_be_archived?).to be true
    end

    it 'can_be_archived? should return false' do
      expect(@item2.can_be_archived?).to be false
    end

    it 'move_to_archive? should return false' do
      expect(@item2.move_to_archive?).to be false
    end

    it 'only_spotify should return true' do
      expect(@item1.only_spotify).to be true
    end

    it 'only_spotify should return false' do
      expect(@item2.only_spotify).to be false
    end

    it 'The item name should be jazz' do
      expect(@item1.name).to eql 'jazz'
    end
  end
end
