class AddMaxChallengeTimeToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :max_challenge_time, :int
  end
end
