class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:mail, :username], unique: true
  end
end
