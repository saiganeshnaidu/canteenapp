class EmployeeProfile < ApplicationRecord
  belongs_to :user
  belongs_to :company
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true
  validates :company_id, presence: true

end
