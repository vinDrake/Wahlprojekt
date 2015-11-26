class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.boolean :correct
      t.string :answer_body
      t.references :question
      t.timestamps null: false
    end
  end
end
