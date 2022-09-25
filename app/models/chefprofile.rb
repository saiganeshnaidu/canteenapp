class Chefprofile < ApplicationRecord
  belongs_to :user
  belongs_to :foodstore
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many_attached :pictures, dependent: :destroy

  validates :name, length: { maximum: 20, minimum: 3 }
  validates :phone, uniqueness: true
  validates :user_id, uniqueness: true
end
