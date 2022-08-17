class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :foodstore
  validates :user_id, presence: true
  validates :foodstore_id, presence: true


end
