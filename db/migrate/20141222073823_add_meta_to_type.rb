class AddMetaToType < ActiveRecord::Migration
  def change
    add_column :types, :meta, :integer
  end
end
