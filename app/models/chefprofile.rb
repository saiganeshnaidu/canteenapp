class Chefprofile < ApplicationRecord
  belongs_to :user
  belongs_to :foodstore
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true
  validates :user_id, presence: true, uniqueness: true
  validates :foodstore_id, presence: true
end
