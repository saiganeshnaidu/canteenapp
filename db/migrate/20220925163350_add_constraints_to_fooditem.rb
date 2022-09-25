class AddConstraintsToFooditem < ActiveRecord::Migration[7.0]
  def change
    change_column_null :fooditems, :name, false
    change_column_null :fooditems, :price, false
    change_column_null :fooditems, :description, false


  end
end
