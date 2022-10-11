class RenameFooditemsToFoodItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :fooditems, :food_items
  end
end
