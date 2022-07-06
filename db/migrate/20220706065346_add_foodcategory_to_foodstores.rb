class AddFoodcategoryToFoodstores < ActiveRecord::Migration[7.0]
  def change
    add_reference :foodstores, :foodcategory, null: false, foreign_key: true
  end
end
