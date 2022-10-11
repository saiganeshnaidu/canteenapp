class RemoveFooditemReferenceInCartItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_items, :fooditem_id
  end
end
