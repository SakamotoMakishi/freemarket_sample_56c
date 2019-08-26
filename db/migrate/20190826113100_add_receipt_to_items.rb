class AddReceiptToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :receipt, :boolean, default: false
  end
end
