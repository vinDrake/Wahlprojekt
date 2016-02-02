class AddLatestEndToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :latest_end, :datetime
  end
end
