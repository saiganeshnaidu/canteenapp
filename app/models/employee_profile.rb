class EmployeeProfile < ApplicationRecord
  belongs_to :user
  belongs_to :company
  has_many :notifications, as: :recipient, dependent: :destroy

  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true
  validates :company_id, presence: true
end
