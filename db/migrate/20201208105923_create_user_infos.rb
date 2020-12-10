class CreateUserInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_infos do |t|

      t.timestamps
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
