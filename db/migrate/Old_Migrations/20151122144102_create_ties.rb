class CreateTies < ActiveRecord::Migration
  def change
    create_table :ties do |t|
      t.references :question, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
