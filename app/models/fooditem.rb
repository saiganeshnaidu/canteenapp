class Fooditem < ApplicationRecord
  belongs_to :foodstore
  has_many :cart_lists, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :name, presence: true, uniqueness: true
end
