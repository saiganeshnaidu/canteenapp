class AddConstraintsToNormalCustomer < ActiveRecord::Migration[7.0]
  def change
    change_column_null :normal_customers, :name, false
    change_column_null :normal_customers, :phone, false
    change_column_null :normal_customers, :user_id, false
  end
end
