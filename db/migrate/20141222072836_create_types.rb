class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.string :description
      t.integer :area
      t.integer :amount

      t.timestamps
    end
  end
end
