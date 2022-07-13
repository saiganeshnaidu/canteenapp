class Foodcategory < ApplicationRecord
    has_many :foodstores, dependent: :destroy
    validates :name, presence: true, uniqueness: true

end
