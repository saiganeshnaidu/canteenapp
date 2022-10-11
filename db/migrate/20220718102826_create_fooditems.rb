class CreateFooditems < ActiveRecord::Migration[7.0]
  def change
    create_table :fooditems do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.references :food_store, null: false, :class_name => 'FoodStore', :foreign_key=> 'food_store_id'

      t.timestamps
    end
  end
end
