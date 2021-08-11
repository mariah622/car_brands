class User < ApplicationRecord
  has_many :cars
  has_many :brands, through: :cars
  validates :email, presence: true, uniqueness: true 
  validates :username, presence: true 
  has_secure_password

  def self.from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u| 
      u.email = auth['info']['email']
      u.username = auth['info']['name']
      u.password = SecureRandom.hex(15)
    end
  end
end 
