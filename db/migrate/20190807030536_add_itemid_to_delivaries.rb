class AddItemidToDelivaries < ActiveRecord::Migration[5.2]
  def change
    add_reference :delivaries, :item, foreign_key: true
  end
end
