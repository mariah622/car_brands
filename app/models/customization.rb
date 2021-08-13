class Customization < ApplicationRecord
  belongs_to :car
  validates :part, presence: true 
  validates :color, presence: true 
end
