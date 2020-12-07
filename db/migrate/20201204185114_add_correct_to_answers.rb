class AddCorrectToAnswers < ActiveRecord::Migration[6.0]
  def up
    change_column :answers, :correct, :boolean, default: false
    change_column :tests, :level, :integer, default: 0
  end

  def down
    change_column :answers, :correct, :sting
    change_column :tests, :level, :integer, default: nil
  end
end
