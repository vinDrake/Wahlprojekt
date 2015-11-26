class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.references :tag, index: true, foreign_key: true
      t.references :feeder, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
