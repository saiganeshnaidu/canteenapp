class CartList < ApplicationRecord
  belongs_to :cart
  belongs_to :fooditem
  validates :cart_id, presence: true
  validates :fooditem_id, presence: true
  validates :quantity, presence: true, numericality: { in: 1..5 }

end
