class AddPermissionsToLists < ActiveRecord::Migration
  def change
    add_column :lists, :permission, :integer, default: 0
  end

end
