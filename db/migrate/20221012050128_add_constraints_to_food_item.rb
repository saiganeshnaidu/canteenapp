class AddConstraintsToFoodItem < ActiveRecord::Migration[7.0]
  def change
    change_column_null :food_items, :name, false
    change_column_null :food_items, :price, false
    change_column_null :food_items, :description, false
  end
end
