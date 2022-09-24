class NormalCustomer < ApplicationRecord
  belongs_to :user

  has_many :notifications, as: :recipient, dependent: :destroy
end
