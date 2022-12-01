require_relative '../lib/genre'
require_relative '../lib/music_album'
require 'date'

describe Genre do
  before(:all) do
    @genre = Genre.new('jazz')
    @item1 = MusicAlbum.new(Date.parse('2001-02-03'), true, 'jazz')
  end
  context 'when testing method inside Genre class' do
    it 'The length of items should be equal to 1' do
      @genre.add_item(@item1)
      expect(@genre.items.size).to eql 1
    end

    it 'Method name should return jazz' do
      expect(@genre.name).to eql 'jazz'
    end
  end
end
