class AddSucceededToParticipations < ActiveRecord::Migration
  def change
    add_column :participations, :succeeded, :boolean
  end
end
