class AddConstraintsToChefprofile < ActiveRecord::Migration[7.0]
  def change
    change_column_null :chefprofiles, :name, false
    change_column_null :chefprofiles, :phone, false
    change_column_null :chefprofiles, :user_id, false
    change_column_null :chefprofiles, :foodstore_id, false

  end
end
