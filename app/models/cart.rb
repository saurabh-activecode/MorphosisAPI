class Cart < ApplicationRecord
  has_many :cart_products
  has_many :products, :through => :cart_products
  belongs_to :region
  belongs_to :user

  STATUS_OPEN = 1 # not checked out
  STATUS_CLOSED = 2 # checked out

  scope :open, -> { where("status = #{STATUS_OPEN}").first }
  scope :closed, -> { where("status = #{STATUS_CLOSED}") }
end
