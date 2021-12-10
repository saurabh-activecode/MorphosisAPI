class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  validates_uniqueness_of :cart_id, scope: :product_id, :message => 'Product already added'
end
