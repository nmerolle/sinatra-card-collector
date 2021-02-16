class User < ActiveRecord::Base
  has_many :cards
  has_secure_password
  validate :username presence: true, uniqueness: true
  validate :email presence: true
end
