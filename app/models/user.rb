class User < ActiveRecord::Base
  has_many :cards
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
end
