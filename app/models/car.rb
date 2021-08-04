class Car < ApplicationRecord
    # belongs_to :brand
    # validates :price, presence: true 

    def name_and_year
        "#{self.name} - #{self.year}"
    end
end
