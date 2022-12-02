require_relative '../lib/game'
require 'date'

describe Game do
  context 'when the game is created' do
    it 'returns the game name' do
      game = Game.new('2021-06-20', 'Yes', '2021-06-20')
      expect(game.publish_date).to eq('2021-06-20')
      expect(game.multiplayer).to eq('Yes')
      expect(game.last_played_at).to eq('2021-06-20')
    end
  end
end
