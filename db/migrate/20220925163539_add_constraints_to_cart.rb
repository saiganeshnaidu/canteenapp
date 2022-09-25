class AddConstraintsToCart < ActiveRecord::Migration[7.0]
  def change
    change_column_null :carts, :user_id, false
    change_column_null :carts, :foodstore_id, false
  end
end
