class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :card_add_to]
  before_action :set_header
  before_action :set_item, only: [:show, :listing, :trading, :completed, :purchase, :purchased, :things,:buyer]
  before_action :set_card, only: [:card_add_to]

  def show
  end

  def user_card
    gon.payjp_key = ENV["PAYJP_KEY"]
  end

  def card_add_to
  end

  def things
    @solod_items = current_user.sold_items.where(receipt: true)
  end

  def listing
  end

  def trading
  end

  def completed
    @solod_items = current_user.sold_items.where(receipt: true)
  end

  def purchase
  end

  def purchased
  end


  def buyer
  end

  def acceptance #受け取り通知
    @item = Item.with_attached_images.find(params[:id])
    @item.update_attributes(receipt: true)
    @item.acceptance_notification_by(current_user)
    flash[:notice] = '受け取り通知を送りました。取り引き完了です。お疲れ様でした！'
    redirect_to root_path
  end

  def shipping #発送通知
    @item = Item.with_attached_images.find(params[:id])
    @item.shipping_notification_by(current_user)
    flash[:notice] = '発送通知を送りました。'
    redirect_to root_path
  end

  def transaction_item #取り引き画面
    @item = Item.with_attached_images.find(params[:id])
    @delivary = Item.find(params[:id]).delivary
    @seller   = Item.find(params[:id]).seller
    @buyer    = Item.find(params[:id]).buyer
  end

  private

  def set_item
    @item = Item.with_attached_images.find_by(params[:id])
    @item_seller = current_user.seling_items
    @item_buyer = current_user.buyed_items
    @item_trading =  current_user.sold_items
  end 

  def set_card
    @card = Card.where(params[:user_id])
  end
end
