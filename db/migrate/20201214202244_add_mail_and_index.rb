class AddMailAndIndex < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, [:title, :level], unique: true
    add_column :users, :mail, :string, null: false 
  end
end
