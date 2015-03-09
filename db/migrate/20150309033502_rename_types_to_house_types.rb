class RenameTypesToHouseTypes < ActiveRecord::Migration
  def change
    rename_table :types, :house_types
  end
end
