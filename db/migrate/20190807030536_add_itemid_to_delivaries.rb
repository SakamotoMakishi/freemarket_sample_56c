class AddItemidToDelivaries < ActiveRecord::Migration[5.2]
  def change
    add_column :delivaries, :item_id, :integer
  end
end
