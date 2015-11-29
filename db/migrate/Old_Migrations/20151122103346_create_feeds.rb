class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :priority
      t.references :feeder, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
