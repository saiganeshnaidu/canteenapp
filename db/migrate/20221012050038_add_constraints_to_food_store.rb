class AddConstraintsToFoodStore < ActiveRecord::Migration[7.0]
  def change
    change_column_null :food_stores, :name, false

  end
end
