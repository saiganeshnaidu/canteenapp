class Room < ApplicationRecord
  belongs_to :cart
  has_many :messages

end
