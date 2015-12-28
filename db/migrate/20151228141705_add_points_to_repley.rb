class AddPointsToRepley < ActiveRecord::Migration
  def change
    add_column :repleys, :points, :integer
  end
end
