class AddConstraintsToCustomer < ActiveRecord::Migration[7.0]
  def change
    change_column_null :customers, :name, false
    change_column_null :customers, :phone, false
    change_column_null :customers, :user_id, false
  end
end
