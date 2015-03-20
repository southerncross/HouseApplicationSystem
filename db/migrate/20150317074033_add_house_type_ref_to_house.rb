class AddHouseTypeRefToHouse < ActiveRecord::Migration
  def change
    add_reference :houses, :house_type, index: true
  end
end
