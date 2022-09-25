class ChangePhoneToBeStringInChefprofiles < ActiveRecord::Migration[7.0]
  def change
    change_column :chefprofiles, :phone, :string
  end
end
