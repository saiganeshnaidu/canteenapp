class Foodstore < ApplicationRecord
    belongs_to :foodcategory
    has_many :fooditems, dependent: :destroy
    has_many :chefprofiles, dependent: :destroy
    has_many :carts, dependent: :destroy
    has_one_attached :image

    validates :name, uniqueness: true
end
