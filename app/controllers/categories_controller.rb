class CategoriesController < ApplicationController
  before_action :set_header

  def show
    if params[:id].to_i <= 3 then
      @items = Item.joins(:category).merge(Category.where(parrent_id:(Category.where(parrent_id:params[:id]).ids)))
    elsif params[:id].to_i <=12 then
      @items = Item.joins(:category).merge(Category.where(parrent_id:params[:id]))
    else
      @items = Item.with_attached_images.where(category_id:params[:id])
    end
  end

  private
  
  def set_header
    @categories1 = Category.where(parrent_id: 0)
    @categories2 = Category.where(parrent_id: Category.where(parrent_id: 0).ids).group_by(&:parrent_id)
    @categories3 = Category.where(parrent_id: Category.where(parrent_id: Category.where(parrent_id: 0).ids).ids).group_by(&:parrent_id)
  end

end
