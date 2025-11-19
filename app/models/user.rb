# class User < ApplicationRecord
# 
#     include Elasticsearch::Model
#     include Elasticsearch::Model::Callbacks

#     has_one :employee_profile, dependent: :destroy
#     has_one :customer, dependent: :destroy
#     has_one :chef_profile, dependent: :destroy, :class_name => "ChefProfile"
#     has_many :carts, dependent: :destroy
#     has_one  :food_store, through: :chef_profile
#     has_one  :company, through: :employee_profile
#     has_many :notifications, as: :recipient, dependent: :destroy
#     has_many :messages

#     has_secure_password
#     validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

#      Elasticsearch index settings and mapping
      # settings index: { number_of_shards: 1 } do
      #   mappings dynamic: false do
      #     indexes :email, type: :keyword
      #   end
      # end

      # # Defines what gets indexed in ES
      # def as_indexed_json(_options = {})
      #   binding.pry
      #   {
      #     email: email
      #   }
      # end

      # # 🔍 Custom search method
      # def self.search_by_email(query)
      #   binding.pry
      #   __elasticsearch__.search(
      #     {
      #       query: {
      #         term: {
      #           email: query.downcase  # assuming stored emails are downcased
      #         }
      #       }
      #     }
      #   ).records
      # end
# end


class User < ApplicationRecord
  include Searchable

  mapping do
    indexes :email, type: :text
  end

  has_one :employee_profile, dependent: :destroy
  has_one :customer, dependent: :destroy
  has_one :chef_profile, dependent: :destroy, class_name: "ChefProfile"
  has_many :carts, dependent: :destroy
  has_one :food_store, through: :chef_profile
  has_one :company, through: :employee_profile
  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :messages

  has_secure_password

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }

end
