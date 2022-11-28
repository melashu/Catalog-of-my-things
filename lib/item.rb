require 'date'
class Item 
    attr_accessor :publish_date

    def initialize(publish_date, archived)
        @id = Random.rand(1..1000)
        @publish_date = publish_date

        private 
        @archived = archived
    end

    def can_be_archived?
      today = DateTime.now
      target_year = 10 * 365
      return true (today - @publish_date).to_i >= target_year 

      false
    end
end