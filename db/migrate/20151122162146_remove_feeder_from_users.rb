class RemoveFeederFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :feeder_id
  end
end
