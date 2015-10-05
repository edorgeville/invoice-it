class Item < ActiveRecord::Base
    belongs_to :invoice
    after_validation :calculate_total

    def calculate_total
        write_attribute(:total, (self.quantity * self.value))
    end
end
