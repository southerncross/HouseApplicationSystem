class CreateSvgs < ActiveRecord::Migration
  def change
    create_table :svgs do |t|
      t.string :description
      t.text :content

      t.timestamps
    end
  end
end
