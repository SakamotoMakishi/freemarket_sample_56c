class LikesController < ApplicationController
  before_action :set_variables

  def create
    like = current_user.likes.new(item_id: @item.id)
    unless like.save
      render :create
    else
      like.save
    end
  end

  def destroy
    like = current_user.likes.find_by(item_id: @item.id)
    unless like.destroy
      render :destroy
    else
      like.destroy
    end
  end

  private

  def set_variables
    @item = Item.find(params[:item_id])
    @id_name = "#like-link-#{@item.id}"
  end
end
