class Foodcategory < ApplicationRecord
    has_many :foodstores, dependent: :destroy
    has_one_attached :category_image

    validates :name, presence: true, uniqueness: true
end
