class User < ApplicationRecord
    has_one :employee_profile, dependent: :destroy
    has_one :customer, dependent: :destroy
    has_one :chef_profile, dependent: :destroy, :class_name => "ChefProfile"
    has_many :carts, dependent: :destroy
    has_one  :food_store, through: :chef_profile
    has_one  :company, through: :employee_profile
    has_many :notifications, as: :recipient, dependent: :destroy
    has_many :messages

    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    
end
