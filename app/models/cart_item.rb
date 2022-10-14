class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :food_item
  
  validates :quantity, numericality: { in: 1..5 }
end
