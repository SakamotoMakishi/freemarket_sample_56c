class RemoveItemidFromDelivaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :delivaries, :item_id, :integer
  end
end
