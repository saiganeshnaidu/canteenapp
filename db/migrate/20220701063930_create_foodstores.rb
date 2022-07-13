class CreateFoodstores < ActiveRecord::Migration[7.0]
  def change
    create_table :foodstores do |t|
      t.string :name
      t.references :foodcategory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
