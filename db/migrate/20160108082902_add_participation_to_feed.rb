class AddParticipationToFeed < ActiveRecord::Migration
  def change
    add_reference :feeds, :participation, index: true, foreign_key: true
  end
end
