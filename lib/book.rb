require_relative './item'
class Book < Item
  attr_reader :publisher, :cover_state, :publish_date

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def can_be_archived?
    archived = super
    return true if archived || cover_state == 'bad'

    false
  end
end
