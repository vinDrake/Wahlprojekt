class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.references :challenge, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
