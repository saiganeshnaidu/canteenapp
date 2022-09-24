class User < ApplicationRecord
    has_one :employee_profile, dependent: :destroy
    has_one :normal_customer, dependent: :destroy
    has_one :chef_profile, dependent: :destroy, :class_name => "Chefprofile"
    has_many :carts, dependent: :destroy
    has_one  :foodstore, through: :chefprofile
    has_one  :company, through: :employee_profile
    has_many :notifications, as: :recipient, dependent: :destroy
    has_many :messages

    has_secure_password
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    #VALID_PASSWORD = /\A(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}\z/
  
    #validates :password, confirmation: true, format: { with: VALID_PASSWORD, message: 'Minimum six characters, at least one letter, one number and one special character' }, unless: -> { password.blank? }
end
