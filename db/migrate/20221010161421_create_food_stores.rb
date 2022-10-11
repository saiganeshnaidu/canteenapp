class CreateFoodStores < ActiveRecord::Migration[7.0]
  def change
    create_table :food_stores do |t|
      t.string :name
      t.references :foodcategory, null: false, foreign_key: true
      t.timestamps
    end
  end
end
