class NormalCustomer < ApplicationRecord
  belongs_to :user

  has_many :notifications, as: :recipient, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20, minimum: 3 }
  validates :phone, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true
end
