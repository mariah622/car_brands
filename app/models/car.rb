class Car < ApplicationRecord

    def name_and_year
        "#{self.name} - #{self.year}"
    end
end
