class AddConstraintsToChefProfile < ActiveRecord::Migration[7.0]
  def change
    change_column_null :chef_profiles, :name, false
    change_column_null :chef_profiles, :phone, false
    change_column_null :chef_profiles, :user_id, false
    change_column_null :chef_profiles, :food_store_id, false
  end
end
