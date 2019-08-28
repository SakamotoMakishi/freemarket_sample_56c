class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :card_add_to]
  before_action :set_header
  before_action :set_item, only: [:show, :listing, :trading, :completed, :purchase, :purchased, :things,:buyer]
  before_action :set_card, only: [:card_add_to]

  def show
    @notifications = current_user.passive_notifications.includes(:visiter,:item).limit(5)#未読のお知らせ
    @notifications_true = current_user.passive_notifications.where(checked: true).includes(:visiter,:item).limit(5)#既読のお知らせ
  end

  def user_card
    gon.payjp_key = ENV["PAYJP_KEY"]
  end

  def card_add_to
  end

  def things
  end

  def listing
  end

  def trading
    @item_trading = current_user.sold_items.where.not(receipt: true)
  end

  def completed
    @solod_items = current_user.sold_items.where(receipt: true)
  end

  def purchase
  end

  def purchased
    @solod_items = current_user.buyed_items.where(receipt: true)
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
    redirect_to transaction_item_user_path(@item)
  end

  def transaction_item #取り引き画面
    @item = Item.with_attached_images.find(params[:id])
    @delivary = Item.find(params[:id]).delivary
    @seller   = Item.find(params[:id]).seller
    @buyer    = Item.find(params[:id]).buyer
    @message  = Item.find(params[:id]).messages
    @category1 = Category.find(Category.find(@item.category.parrent_id).parrent_id)
  end

  private

  def set_item
    @item = Item.with_attached_images.find_by(params[:id])
    @item_seller = current_user.seling_items
    @item_buyer = current_user.buyed_items.where.not(receipt: true)
    @item_trading =  current_user.sold_items.where.not(receipt: true)
  end 

  def set_card
    @card = Card.where(params[:user_id])
  end
end
