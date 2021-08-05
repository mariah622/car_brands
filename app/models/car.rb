class Car < ApplicationRecord
    # belongs_to :brand

    validates :color, :condition, presence: true, length: {minimum: 2}  
    validates :name, presence: true, uniqueness: {scope: :year, message: "Sorry that Car and Year already exists"}
    validates :price, numericality: true 

    def name_and_year
        "#{self.name} - #{self.year}"
    end
end


# uniqueness: {scope: year, message: "Tha