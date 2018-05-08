class User < ApplicationRecord
  has_secure_password
  has_many :encounters
  has_many :characters
  has_many :monsters
end
