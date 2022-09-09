class Chefprofile < ApplicationRecord
  belongs_to :user
  belongs_to :foodstore
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true
  validates :foodstore_id, presence: true
  
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many_attached :pictures, dependent: :destroy
end
