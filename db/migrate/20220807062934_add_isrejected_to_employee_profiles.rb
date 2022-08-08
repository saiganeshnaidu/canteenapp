class AddIsrejectedToEmployeeProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :employee_profiles, :isrejected, :boolean, default: false
  end
end
