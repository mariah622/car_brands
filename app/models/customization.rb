class Customization < ApplicationRecord
  belongs_to :car
  has_many :customizations, through: :cars
  validates :part, presence: true 
  validates :color, presence: true 
end
