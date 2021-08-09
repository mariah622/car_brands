class Car < ApplicationRecord
    belongs_to :brand
    accepts_nested_attributes_for :brand
    
    def brand_attributes(hash_of_attributes)
        if !hash_of_attributes["name"].blank? && !hash_of_attributes["year_created"]
            self.brand = Brand.fine_or_create_by(hash_of_attributes)
        end

    end 

    validates :color, :condition, presence: true, length: {minimum: 2}  
    validates :name, presence: true, uniqueness: {scope: :color, message: " already exists with that color"}
    validates :price, numericality: true 
    validates :year, numericality: true 



    def name_and_year
        "#{self.name} : #{self.year}"
    end
end
