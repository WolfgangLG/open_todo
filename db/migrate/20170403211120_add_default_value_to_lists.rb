class AddDefaultValueToLists < ActiveRecord::Migration
  def change
    change_column_default :lists, :public, true
  end
end
