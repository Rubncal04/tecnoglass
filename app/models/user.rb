class User < ApplicationRecord
  require 'securerandom'

  has_many :products
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum:6 }
end
