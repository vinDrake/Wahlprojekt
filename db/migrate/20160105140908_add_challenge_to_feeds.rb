class AddChallengeToFeeds < ActiveRecord::Migration
  def change
    add_reference :feeds, :challenge, index: true, foreign_key: true
  end
end
