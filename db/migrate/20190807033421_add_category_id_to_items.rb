class AddCategoryIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :category
    add_reference :items, :brand
  end
end
