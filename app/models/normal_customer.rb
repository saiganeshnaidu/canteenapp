class NormalCustomer < ApplicationRecord
  belongs_to :user

  has_many :notifications, as: :recipient, dependent: :destroy

  validates :name, length: { maximum: 20, minimum: 3 }
  validates :phone, uniqueness: true
  validates :user_id, uniqueness: true
end
