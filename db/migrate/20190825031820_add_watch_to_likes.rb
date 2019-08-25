class AddWatchToLikes < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :watch, :integer
  end
end
