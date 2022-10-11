class AddFoodStoreToFooditems < ActiveRecord::Migration[7.0]
  def change
    add_reference :fooditems, :food_store, null: false, foreign_key: true
  end
end
