class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :fooditem
  
  before_validation :check_cartlist
  
  def check_cartlist
    if self.quantity<0 && self.quantity>6
      error.add[:quantity, message: 'Quantity must between 1-5']
    end
  end

end