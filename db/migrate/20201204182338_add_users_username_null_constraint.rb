class AddUsersUsernameNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :username, false)
    change_column_null(:categories, :title, false)
    change_column_null(:answers, :variant, false)
    change_column_null(:questions, :body, false)
    change_column_null(:categories, :title, false)
    change_column_null(:tests, :title, false)
  end
end
