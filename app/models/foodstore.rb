class Foodstore < ApplicationRecord
    belongs_to :foodcategory
    has_many :fooditems, dependent: :destroy
    has_many :chef_profiles, dependent: :destroy
    has_many :carts, dependent: :destroy

    validates :name, presence: true, uniqueness: true
end
