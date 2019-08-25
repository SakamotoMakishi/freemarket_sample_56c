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

  def set_header
    @categories1 = Category.where(parrent_id: 0)
    @categories2 = Category.where(parrent_id: Category.where(parrent_id: 0).ids).group_by(&:parrent_id)
    @categories3 = Category.where(parrent_id: Category.where(parrent_id: Category.where(parrent_id: 0).ids).ids).group_by(&:parrent_id)
  end
end
