class CardsController < ApplicationController
  require "payjp"
  before_action :set_card
  before_action :set_item, only: [:pay]

  def index
    if Item.find(params[:id]).seller_id == current_user.id
      redirect_to root_path
    else
      @item = Item.with_attached_images.find(params[:id])
      @user = Item.find(params[:id]).seller
    end
  end

  def new
    gon.payjp_key = ENV["PAYJP_KEY"]
  end

  def show
    @item = Item.with_attached_images.find(params[:id])
    @user = Item.find(params[:id]).seller
  end

  def regist
  end

  def make
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.create(
      card: params['token'],
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id)
        if @card.save
          redirect_to regist_cards_path
        else
          render :new
      end
  end

  def pay
    if current_user.card.blank?
      redirect_to card_add_to_user_path(current_user)
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      card = current_user.card
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy',
      )
      if @item.update(buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to action: 'show'
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to action: 'show'
      end
    end
  end

  def destroy
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy
      redirect_to card_add_to_user_path(current_user), notice: "削除しました"
    else
      redirect_to card_add_to_user_path(current_user), alert: "削除できませんでした"
    end
  end


  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
