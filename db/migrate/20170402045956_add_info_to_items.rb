class AddInfoToItems < ActiveRecord::Migration
  def change
    add_column :items, :name, :string
    add_column :items, :body, :string
  end
end
