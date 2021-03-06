class DropTableTestsUsers < ActiveRecord::Migration[6.0]
  def up
    drop_table :tests_users, if_exists: true
  end

  def down
    create_table :tests_users do |t|
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
