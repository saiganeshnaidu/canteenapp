class AddFoodCategoryToFoodStores < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_stores, :food_category, null: false, foreign_key: true
  end
end
