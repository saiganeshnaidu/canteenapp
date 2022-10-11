class AddConstraintsToCartList < ActiveRecord::Migration[7.0]
  def change
    change_column_null :cart_items, :quantity, false
    change_column_null :cart_items, :fooditem_id, false
    change_column_null :cart_items, :cart_id, false
  end
end
