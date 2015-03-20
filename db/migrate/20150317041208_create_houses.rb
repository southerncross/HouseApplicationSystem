class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :door
      t.integer :unit
      t.integer :floor

      t.timestamps
    end
  end
end
