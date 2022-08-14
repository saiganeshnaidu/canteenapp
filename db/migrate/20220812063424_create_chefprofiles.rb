class CreateChefprofiles < ActiveRecord::Migration[7.0]
  def change
    create_table :chefprofiles do |t|
      t.string :name
      t.integer :phone
      t.references :user, null: false, foreign_key: true
      t.references :foodstore, null: false, foreign_key: true
      t.boolean :isapproved, default: false
      t.boolean :isrejected, default: false

      t.timestamps
    end
  end
end
