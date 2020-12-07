class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.string :variant

      t.timestamps
    end
    add_reference :questions, :test, null: false, foreign_key: true
    add_reference :answers, :question, null: false, foreign_key: true
  end
end
