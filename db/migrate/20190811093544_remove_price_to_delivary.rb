class RemovePriceToDelivary < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivaries, :price, :integer
  end
end