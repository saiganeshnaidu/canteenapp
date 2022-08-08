class CreateEmployeeProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_profiles do |t|
      t.string :name
      t.string :phone
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.boolean :isapproved, default: false

      t.timestamps
    end
  end
end
