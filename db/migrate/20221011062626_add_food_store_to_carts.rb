class AddFoodStoreToCarts < ActiveRecord::Migration[7.0]
  def change
    add_reference :carts, :food_store, null: false, foreign_key: true
  end
end
