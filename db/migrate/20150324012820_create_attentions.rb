class CreateAttentions < ActiveRecord::Migration
  def change
    create_table :attentions do |t|
      t.integer :user_id
      t.integer :house_id
    end
  end
end
