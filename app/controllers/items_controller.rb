
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
    @item = Item.new(item_params)
    @delivary = Delivary.new(delivary_params)
    if @item.save && @delivary.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @user = Item.find(params[:id]).seller
    @user_item = Item.where(seller_id: @user.id).order("id DESC").limit(6)
  end

  def show_user_item
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @delivary = @item.delivary
  end

  def update
    @item = Item.find(params[:id])
    @item.images.detach
    @item.update(item_params)
    @delivary = Delivary.find_by(item_id:params[:id])
    @delivary.update(delivary_params)
    redirect_to action: 'show_user_item'
  end

  def image_add
    @item.images.attach(params.require(:item).permit[:images])
  end

  def image_del
    @item.images.purge(params.require(:item).permit[:images])
  end


  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :category_id, :brand_id, :status, images: []).merge(params.require(:item).require(:item).permit(:price)).merge(seller_id: current_user.id)
  end

  def delivary_params
    params.require(:item).require(:delivary).permit(:price, :area, :delivary_day).merge(item_id: @item.id)
  end


end
