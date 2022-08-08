class Fooditem < ApplicationRecord
  belongs_to :foodstore
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true
  validates :name, presence: true, uniqueness: true
end
