class Car < ApplicationRecord
    belongs_to :brand
    belongs_to :user
    has_many :customizations
    accepts_nested_attributes_for :brand
    
    def brand_attributes=(hash_of_attributes)
        if !hash_of_attributes["name"].blank? && !hash_of_attributes["year_created"].blank?
            self.brand = Brand.find_or_create_by(hash_of_attributes)
        end
    end

    validates :color, :condition, presence: true, length: {minimum: 2}  
    validates :name, presence: true, uniqueness: {scope: :color, message: " already exists with that color"}
    validates :price, numericality: true 
    validates :year, numericality: true 

    scope :order_by_price, -> {order(:price)}
    scope :color_selector, ->(color){where('color ==  ?', color)}

    # scope :order_by_condition, -> {order(:condition)}


    def name_and_year
        "#{self.name} : #{self.year}"
    end

end 