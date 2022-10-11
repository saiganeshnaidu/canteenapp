class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food_store, null: false, foreign_key: true
      t.string :order_status, default: "Placed"

      t.timestamps
    end
  end
end
