class Foodcategory < ApplicationRecord
    validates :name, presence: true, uniqueness: true

end
