class RenameCartlistToCartitem < ActiveRecord::Migration[7.0]
  def change
    rename_table :cart_lists, :cart_items
  end
end
