class AddCompletionToItems < ActiveRecord::Migration
  def change
    add_column :items, :completed, :boolean, default: true, null: false
  end
end
