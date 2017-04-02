class AddInfoToLists < ActiveRecord::Migration
  def change
    add_column :lists, :title, :string
    add_column :lists, :description, :string
  end
end
