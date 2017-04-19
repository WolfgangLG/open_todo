class RemovePublicFromLists < ActiveRecord::Migration
  def change
    remove_column :lists, :public
  end
end
