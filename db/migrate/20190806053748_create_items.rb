class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name            ,null: false
      t.integer :price          ,null: false
      t.text :text              ,null: false
      t.string :status          ,null: false
      t.integer :seller_id
      t.integer :buyer_id
      t.integer :category_id
      t.integer :brand_id
      t.timestamps
    end
    add_index :items, :name
  end
end_mtt