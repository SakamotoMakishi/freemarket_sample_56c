class RemoveCardIdFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :card_id, :string
  end
end
