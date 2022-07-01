class User < ApplicationRecord
    enum role: [:Admin, :Employee, :Chef]
    
    has_secure_password

    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

end
