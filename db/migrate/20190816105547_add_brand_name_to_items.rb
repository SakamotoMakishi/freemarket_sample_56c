class AddBrandNameToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :brand_name, :string
  end
end
