class Company < ApplicationRecord
    has_many :employee_profiles, dependent: :destroy
    
    validates :name, presence: true, uniqueness: true
end
