class Foodstore < ApplicationRecord
    belongs_to :foodcategory
    has_many :fooditems, dependent: :destroy
    validates :name, presence: true, uniqueness: true
end
