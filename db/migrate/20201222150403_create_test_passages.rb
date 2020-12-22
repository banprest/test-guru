class CreateTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :correct_questions, default: 0
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
