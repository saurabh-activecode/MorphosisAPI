class User < ApplicationRecord
  has_secure_password
  belongs_to :region
  has_many :carts
end
