class Region < ApplicationRecord
  belongs_to :country
  belongs_to :currency
end
