class CategoriesController < ApplicationController

  def show
    if params[:id].to_i <= 3 then
      @items = Item.joins(:category).merge(Category.where(parrent_id:(Category.where(parrent_id:params[:id]).ids)))
    elsif params[:id].to_i <=12 then
      @items = Item.joins(:category).merge(Category.where(parrent_id:params[:id]))
    else
      @items = Item.with_attached_images.where(category_id:params[:id])
    end
  end


end
