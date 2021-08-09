class Brand < ApplicationRecord
    has_many :cars
    accepts_nested_attributes_for :cars, reject_if: proc { |attributes| attributes['color'].blank? || attributes['price'].blank? || attributes['condition'].blank?}  
    validates :name, presence: true
end
