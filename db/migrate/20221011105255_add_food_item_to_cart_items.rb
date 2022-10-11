class AddFoodItemToCartItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :cart_items, :food_item, null: false, foreign_key: true
  end
end
