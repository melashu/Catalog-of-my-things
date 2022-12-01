# Authors data preserved in  json file
class Author
  def to_json(*args)
    {
      'json_class' => self.class.name,
      'author' => [first_name, last_name]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['author'])
  end
end
