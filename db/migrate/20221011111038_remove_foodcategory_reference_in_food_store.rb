class RemoveFoodcategoryReferenceInFoodStore < ActiveRecord::Migration[7.0]
  def change
    remove_column :food_stores, :foodcategory_id
  end
end
