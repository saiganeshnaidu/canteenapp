class DropFoodstoreTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :foodstores
  end
end
