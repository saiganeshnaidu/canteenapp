class CreateNormalCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :normal_customers do |t|
      t.string :name
      t.string :phone
      t.references :user, null: false, foreign_key: true
      t.boolean :isapproved, default: false
      t.boolean :isrejected, default: false

      t.timestamps
    end
  end
end
