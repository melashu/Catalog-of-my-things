class MusicAlbum
  def to_json(*args)
    {

      'json_class' => self.class.name,
      'music' => [publish_date, only_spotify, name]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['music'])
  end
end
