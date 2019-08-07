class AddPhoneNumToAddressInput < ActiveRecord::Migration[5.2]
  def change
    add_column :address_inputs, :phone_num, :integer, unique: true
  end
end
