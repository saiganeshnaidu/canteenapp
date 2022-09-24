class Fooditem < ApplicationRecord
  belongs_to :foodstore
  has_many :cart_lists, dependent: :destroy
  has_one_attached :item_image

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :name, presence: true, uniqueness: true
end
