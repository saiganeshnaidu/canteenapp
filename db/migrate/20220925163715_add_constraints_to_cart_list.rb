class AddConstraintsToCartList < ActiveRecord::Migration[7.0]
  def change
    change_column_null :cart_lists, :quantity, false
    change_column_null :cart_lists, :fooditem_id, false
    change_column_null :cart_lists, :cart_id, false
  end
end
