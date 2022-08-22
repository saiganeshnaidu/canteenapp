class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :foodstore
  has_many :cart_lists, dependent: :destroy
  validates :user_id, presence: true
  validates :foodstore_id, presence: true


end
