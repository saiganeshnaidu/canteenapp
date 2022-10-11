class RemoveFoodstoreFromCarts < ActiveRecord::Migration[7.0]
  def change
    remove_reference :carts, :foodstore, null: false, foreign_key: true
  end
end
