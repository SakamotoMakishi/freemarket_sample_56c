class AddDelivaryMethodToDelivaries < ActiveRecord::Migration[5.2]
  def change
    add_column :delivaries, :delivary_method, :string
  end
end
