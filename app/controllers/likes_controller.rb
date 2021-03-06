class LikesController < ApplicationController
  before_action :set_variables , only: [:create, :destroy]
  before_action :set_header , only: :index

  def index
    @item =  Item.where(id: current_user.likes.map{|hash| hash[:item_id]}).limit(15)
    current_user.likes.update_all(watch: 1)
  end

  def create
    like = current_user.likes.new(item_id: @item.id, watch: 0)
    unless like.save
      render :create
    else
      like.save
      @item.create_notification_by(current_user)
    end
  end

  def destroy
    like = current_user.likes.find_by(item_id:@item.id)
    unless like.destroy
      render :destroy
    else
      like.destroy
      @item.delete_notification_by(current_user)
    end
  end

  private

  def set_variables
    @item = Item.find(params[:item_id])
    @id_name = "#like-link-#{@item.id}"
  end
end
