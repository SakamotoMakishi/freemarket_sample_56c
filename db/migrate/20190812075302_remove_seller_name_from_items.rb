class RemoveSellerNameFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :seller_name, :string
  end
end
