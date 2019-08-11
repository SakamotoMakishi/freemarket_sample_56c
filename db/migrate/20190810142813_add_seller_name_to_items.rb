class AddSellerNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :seller_name, :string
  end
end
