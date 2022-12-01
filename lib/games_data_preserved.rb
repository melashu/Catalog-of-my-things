# games data preserved in  json file
class Game
  def to_json(*args)
    {
      'json_class' => self.class.name,
      'game' => [publish_date, multiplayer, last_played_at]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['game'])
  end
end
