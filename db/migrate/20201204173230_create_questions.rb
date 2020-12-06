class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :body

      t.timestamps
    end
    add_reference :questions, :test, null: false, foreign_key: true
  end
end
