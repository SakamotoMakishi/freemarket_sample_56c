class AddPriceToDelivary < ActiveRecord::Migration[5.2]
  def change
    add_column :delivaries, :price, :string ,null: false
  end
end
