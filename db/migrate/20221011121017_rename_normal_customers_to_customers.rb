class RenameNormalCustomersToCustomers < ActiveRecord::Migration[7.0]
  def change
    rename_table :normal_customers, :customers
  end
end
