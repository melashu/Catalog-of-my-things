class Genre
  def to_json(*args)
    {

      'json_class' => self.class.name,
      'genre' => [name]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['genre'])
  end
end
