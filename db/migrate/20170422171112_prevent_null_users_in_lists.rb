class PreventNullUsersInLists < ActiveRecord::Migration
  def change
    change_column_null :lists, :user_id, false
    change_column_null :items, :list_id, false
  end
end
