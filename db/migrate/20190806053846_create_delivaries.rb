class CreateDelivaries < ActiveRecord::Migration[5.2]
  def change
    create_table :delivaries do |t|
      t.integer :price           ,null: false
      t.string :area             ,null: false
      t.string :delivary_day     ,null: false
      t.integer :item_id
      t.timestamps
    end
  end
end
