class Brand < ApplicationRecord
    has_many :cars
    validates :name, presence: true
    validates :name, uniqueness: true 
end
