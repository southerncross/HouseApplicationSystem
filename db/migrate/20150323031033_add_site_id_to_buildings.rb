class AddSiteIdToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :site_id, :integer
  end
end
