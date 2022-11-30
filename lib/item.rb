require 'date'
require_relative './genre'
class Item
  attr_accessor :publish_date
  attr_reader :genre

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def move_to_archive?
    archive = can_be_archived?
    @archived = true if archive
    archive
  end

  private

  def can_be_archived?
    today = DateTime.now
    target_year = 10 * 365
    diff = today - @publish_date
    return true if diff.to_i >= target_year

    false
  end
end
