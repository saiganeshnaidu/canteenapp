class CreateCartLists < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_lists do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :fooditem, null: false, foreign_key: true
      t.integer :quantity, default: 0
      t.string :description

      t.timestamps
    end
  end
end
