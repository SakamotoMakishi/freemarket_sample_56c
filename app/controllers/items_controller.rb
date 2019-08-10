class ItemsController < ApplicationController
  protect_from_forgery 
  def index
    # @women＿items = Category.find(1).items
    # @men＿items = Category.find(2).items
    # @child＿items = Category.find(3).items
    # @chanel＿items = Brand.find(1).items
    # @mvuitton＿items = Brand.find(2).items
    # @nike＿items = Brand.find(3).items
  end

  def new
    @item = Item.new
    @delivary = Delivary.new
  end

  def create
    @item = Item.create(item_params)
    @delivary = Delivary.create(delivary_params)
  end
  
  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :brand_id, :status, images: []).merge(params.require(:item).require(:item).permit(:price))
  end

  def delivary_params
    params.require(:item).require(:delivary).permit(:price, :area, :delivary_day)
  end
end
