class FoodStore < ApplicationRecord
  belongs_to :food_category
    has_many :food_items, dependent: :destroy
    has_many :chefprofiles, dependent: :destroy
    has_many :carts, dependent: :destroy
    has_one_attached :image

    validates :name, uniqueness: true
end
