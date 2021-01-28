class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:first_name, :last_name]
    add_index :categories, :title
    add_index :questions, :body
    add_index :answers, :variant
  end
end
