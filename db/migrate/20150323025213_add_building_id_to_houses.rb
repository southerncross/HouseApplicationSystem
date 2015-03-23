class AddBuildingIdToHouses < ActiveRecord::Migration
  def change
    add_column :houses, :building_id, :integer
  end
end
