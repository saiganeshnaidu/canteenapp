class Company < ApplicationRecord
    has_many :employee_profiles
    validates :name, presence: true, uniqueness: true

end
