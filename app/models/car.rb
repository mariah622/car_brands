class Car < ApplicationRecord
    # belongs_to :brand

    validates :color, :condition, presence: true, length: {minimum: 2}  
    validates :name, presence: true, uniqueness: {scope: [:color, :year], message: " already exists with that year and color"}
    validates :price, numericality: true 
    validates :year, numericality: true 

    def name_and_year
        "#{self.name} - #{self.year}"
    end
end
