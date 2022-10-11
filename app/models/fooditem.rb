class Fooditem < ApplicationRecord
  belongs_to :food_store
  has_many :cart_items, dependent: :destroy
  has_one_attached :item_image

  validates :name, uniqueness: true
end
