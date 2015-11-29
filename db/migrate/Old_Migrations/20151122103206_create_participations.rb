class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.boolean :complete
      t.references :user, index: true, foreign_key: true
      t.references :challenge, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
