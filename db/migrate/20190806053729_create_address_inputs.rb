class CreateAddressInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :address_inputs do |t|
      t.string :first_name         ,null: false
      t.string :last_name          ,null: false
      t.string :first_name_kana    ,null: false
      t.string :last_name_kana     ,null: false
      t.integer :postal_code       ,null: false
      t.string :prefectures        ,null: false
      t.string :city               ,null: false
      t.string :address            ,null: false
      t.string :building_name      ,null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
