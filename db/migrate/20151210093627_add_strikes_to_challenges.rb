class AddStrikesToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :strikes, :int
  end
end
