class ItemsController < ApplicationController
  protect_from_forgery 
  def index
    @women_items = Item.order("id DESC").limit(4)
    @men_items = Item.order("id DESC").limit(4)
    @child_items = Item.order("id DESC").limit(4)
    @chanel_items = Item.order("id DESC").limit(4)
    @vuitton_items = Item.order("id DESC").limit(4)
    @nike_items = Item.order("id DESC").limit(4)
    
  end

  def new
    @item = Item.new
    @delivary = Delivary.new
  end

  def create
    @item = Item.create(item_params)
    @delivary = Delivary.create(delivary_params)
    redirect_to item_path(@item)
  end
  
  def show
    @item = Item.find(params[:id])
    @user = Item.find(params[:id]).seller
    @user_item = Item.where(seller_id: @user.id).order("id DESC").limit(6)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :brand_id, :status, images: []).merge(params.require(:item).require(:item).permit(:price)).merge(seller_id: current_user.id,seller_name: current_user.nickname)
  end

  def delivary_params
    params.require(:item).require(:delivary).permit(:price, :area, :delivary_day)
  end
end
