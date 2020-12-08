class CreateUserInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :user_infos do |t|

      t.timestamps
      #add_reference :user_infos, :test, foreign_key: true
      #add_reference :user_infos, :user, foreign_key: true
      #Выдает ошибку что такой таблицы нет SQLite3::SQLException: no such table: user_infos
    end
    add_reference :user_infos, :test, foreign_key: true
    add_reference :user_infos, :user, foreign_key: true
  end
end
