class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :card_add_to]
  before_action :set_header
  before_action :set_item, only: [:show, :listing, :trading, :completed, :purchase, :purchased, :things, :shipping, :transaction_item,:acceptance]
  before_action :set_card, only: [:card_add_to]

  def show
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
  end

  def completed
    @solod_items = current_user.sold_items.where(receipt: true)
  end

  def purchase
  end

  def purchased
  end

  def acceptance #受け取り通知
    @item.update_attributes(receipt: true)
    @item.acceptance_notification_by(current_user)
    flash[:notice] = '受け取り通知を送りました。取り引き完了です。お疲れ様でした！'
    redirect_to root_path
  end

  def shipping #発送通知
    @item.shipping_notification_by(current_user)
    flash[:notice] = '発送通知を送りました。'
    redirect_to root_path
  end

  def transaction_item
    @category1 = Category.find(Category.find(@item.category.parrent_id).parrent_id)
    @category2 = Category.find(@item.category.parrent_id)
    @category3 = @item.category
    # @comments = Item.find(params[:id]).comments
    @delivary = Item.find(params[:id]).delivary
    @seller   = Item.find(params[:id]).seller
    @buyer    = Item.find(params[:id]).buyer
    @notifications_buy = current_user.passive_notifications.includes(:visiter,:item).where(action: "buy")
    @notifications = current_user.active_notifications.includes(:visiter,:item).where(action: "buy")
    @notifications1 = current_user.active_notifications + current_user.passive_notifications
    @notifications2 = @notifications + @notifications_buy
  end

  private

  def set_item
    @item = Item.with_attached_images.find(params[:id])
    @item_seller = Item.with_attached_images.where(seller_id: current_user.id).where(buyer_id: nil).order("id DESC").limit(10)
    @item_buyer = Item.with_attached_images.where(buyer_id: current_user.id).order("id DESC").limit(5)
    @item_trading =  Item.with_attached_images.where(seller_id: current_user.id).where("buyer_id > ?", 1)
    @users = User.all
    @hash = @item_trading.map{|hash| hash[:buyer_id] -1}
  end

  def set_card
    @card = Card.where(params[:user_id])
  end
end
