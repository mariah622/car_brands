class Car < ApplicationRecord
    # belongs_to :brand

    def name_and_year
        "#{self.name} - #{self.year}"
    end
end
