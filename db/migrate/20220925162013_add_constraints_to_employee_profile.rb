class AddConstraintsToEmployeeProfile < ActiveRecord::Migration[7.0]
  def change
    change_column_null :employee_profiles, :name, false
    change_column_null :employee_profiles, :phone, false
    change_column_null :employee_profiles, :user_id, false
    change_column_null :employee_profiles, :company_id, false

  end
end
