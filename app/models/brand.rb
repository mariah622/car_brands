class Brand < ApplicationRecord
    has_many :cars 
    has_many :users, through: :cars
    accepts_nested_attributes_for :cars, reject_if: proc { |attributes| attributes['color'].blank? || attributes['price'].blank? || attributes['condition'].blank?}
end
