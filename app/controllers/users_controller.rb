class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :card_add_to]
  before_action :set_header
  before_action :set_item, only: [:listing, :trading, :completed, :purchase, :purchased, :show]
  before_action :set_card, only: [:card_add_to]

  def show
  end

  def user_card
    gon.payjp_key = ENV["PAYJP_KEY"]
  end

  def card_add_to
  end

  def listing
  end

  def trading
  end

  def completed
  end

  def purchase
  end

  def purchased
  end

  private

  def set_item
    @item_seller = Item.with_attached_images.where(seller_id: current_user.id).order("id DESC").limit(10)
    @item_buyer = Item.with_attached_images.where(buyer_id: current_user.id).order("id DESC").limit(5)
    @completed =  Item.with_attached_images.where("buyer_id > ?", 1).where(seller_id: current_user.id).order("id DESC").limit(10)
  end

  def set_card
    @card = Card.where(params[:user_id])
  end
end
