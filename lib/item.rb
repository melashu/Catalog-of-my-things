require 'date'
class Item
  attr_accessor :publish_date
  attr_reader :archived

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
  end

  def can_be_archived?
    today = DateTime.now
    target_year = 10 * 365
    diff = today - @publish_date
    return true if diff.to_i >= target_year

    false
  end

  def move_to_archive?
    @archived = can_be_archived == true
  end
end
