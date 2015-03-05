class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.integer :area
      t.text :transportation
      t.text :medicine
      t.text :food

      t.timestamps
    end
  end
end
