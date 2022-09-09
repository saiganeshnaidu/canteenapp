class User < ApplicationRecord
    has_one :employee_profile, dependent: :destroy
    has_one :chef_profile, dependent: :destroy, :class_name => "Chefprofile"
    has_many :carts, dependent: :destroy
    has_one  :foodstore, through: :chefprofile
    has_one  :company, through: :employee_profile
    has_many :notifications, as: :recipient, dependent: :destroy

    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
end
