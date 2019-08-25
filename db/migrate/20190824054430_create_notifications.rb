class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visiter_id
      t.integer :visited_id
      t.integer :item_id
      t.integer :comment_id
      t.string :action
      t.boolean :checked,default: false
      t.timestamps
      t.index ["visited_id"], name: "index_notifications_on_visited_id"
      t.index ["visiter_id"], name: "index_notifications_on_visiter_id"
    end
  end
end
