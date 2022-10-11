class FoodCategory < ApplicationRecord
    has_many :food_stores, dependent: :destroy
    has_one_attached :category_image

    validates :name, presence: true, uniqueness: true
end
