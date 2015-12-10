class AddStrikesToParticipations < ActiveRecord::Migration
  def change
    add_column :participations, :strikes, :int
  end
end
