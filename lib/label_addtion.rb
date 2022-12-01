class Label
  def to_json(*args)
    {

      'json_class' => self.class.name,
      'label' => [title, color]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['label'])
  end
end
