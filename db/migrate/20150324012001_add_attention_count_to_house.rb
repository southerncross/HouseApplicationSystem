class AddAttentionCountToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :attention_count, :integer
  end
end
