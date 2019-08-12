class AddressInputsController < ApplicationController
  def new
    @address_inputs = AddressInput.new
  end

  def create
    @address_inputs = AddressInput.create(address_input_params)
      redirect_to new_card_path
  end

  private
  def address_input_params
    params.require(:address_input).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :prefectures, :city, :address, :building_name, :phone_num).merge(user_id: current_user.id)
  end
end
