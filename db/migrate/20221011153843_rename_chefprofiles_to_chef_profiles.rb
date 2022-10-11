class RenameChefprofilesToChefProfiles < ActiveRecord::Migration[7.0]
  def change
    rename_table :chefprofiles, :chef_profiles
  end
end
