class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index
    @item = Item.with_attached_images.find(params[:id])
    @user = Item.find(params[:id]).seller
  end

  def new
    card = Card.where(user_id: current_user.id)
  end

  def show
  end

  def make
    Payjp.api_key = "sk_test_db9ec38e76c4672981fd3ede"
      customer = Payjp::Customer.create(
      card: params['token'],
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id)
        if @card.save
          redirect_to root_path
        else
          redirect_to action: "new"
        end
  end

  def pay
    if current_user.card.blank?
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      @item = Item.find(params[:id])
      card = current_user.card
      Payjp.api_key = "sk_test_db9ec38e76c4672981fd3ede"
      Payjp::Charge.create(
      amount: @item.price,
      customer: card.customer_id,
      currency: 'jpy',
      )
      if @item.update(buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to root_path
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to root_path
      end
    end
  end

  def destroy
    Payjp.api_key = "sk_test_db9ec38e76c4672981fd3ede"
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy
      redirect_to action: "index", notice: "削除しました"
    else
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end


  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
