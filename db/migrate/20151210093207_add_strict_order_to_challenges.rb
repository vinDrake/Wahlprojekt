class AddStrictOrderToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :strict_order, :boolean
  end
end
