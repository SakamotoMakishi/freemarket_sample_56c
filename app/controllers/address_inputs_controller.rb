class AddressInputsController < ApplicationController
  def new
    @address_inputs = AddressInput.new
  end

  def create
    @address_inputs = AddressInput.new(address_input_params)
      if @address_inputs.save
        redirect_to new_card_path
      else
        render :new
      end
  end

  def edit
  end

  def update
    @address_inputs = AddressInput.find_by(user_id: current_user.id)
    if @address_inputs.update(edit_address_input_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def address_input_params
    params.require(:address_input).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :prefectures, :city, :address, :building_name, :phone_num).merge(user_id: current_user.id)
  end

  def edit_address_input_params
    params.permit(:postal_code, :prefectures, :city, :address, :building_name).merge(user_id: current_user.id, first_name: current_user.address_input.first_name, last_name: current_user.address_input.last_name, first_name_kana: current_user.address_input.first_name_kana, last_name_kana: current_user.address_input.first_name_kana, phone_num: current_user.address_input.phone_num)
  end
end
