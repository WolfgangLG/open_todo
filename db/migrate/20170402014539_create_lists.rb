class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :public

      t.timestamps null: false
    end
  end
end
