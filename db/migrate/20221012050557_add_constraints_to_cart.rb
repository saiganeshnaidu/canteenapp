class AddConstraintsToCart < ActiveRecord::Migration[7.0]
  def change
    change_column_null :carts, :user_id, false
    change_column_null :carts, :food_store_id, false
  end
end
