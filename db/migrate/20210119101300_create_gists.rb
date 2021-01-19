class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.belongs_to :user
      t.string :question_body
      t.string :gist_url

      t.timestamps
    end
  end
end
