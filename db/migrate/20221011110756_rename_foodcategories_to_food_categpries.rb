class RenameFoodcategoriesToFoodCategpries < ActiveRecord::Migration[7.0]
  def change
    rename_table :foodcategories, :food_categories
  end
end
