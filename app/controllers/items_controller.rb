
class ItemsController < ApplicationController
  protect_from_forgery
  before_action :set_item, only: [:show, :show_user_item, :edit, :update, :destroy]

  def index
    @women_items = Item.joins(:category).merge(Category.where(parrent_id: Category.where(parrent_id: 1).ids)).with_attached_images.order("id DESC").limit(4)
    @men_items = Item.joins(:category).merge(Category.where(parrent_id: Category.where(parrent_id: 2).ids)).with_attached_images.order("id DESC").limit(4)
    @child_items = Item.joins(:category).merge(Category.where(parrent_id: Category.where(parrent_id: 3).ids)).with_attached_images.order("id DESC").limit(4)
    @chanel_items = Item.with_attached_images.order("id DESC").limit(4)
    @vuitton_items = Item.with_attached_images.order("id DESC").limit(4)
    @nike_items = Item.with_attached_images.order("id DESC").limit(4)
    @categories1 = Category.where(parrent_id: 0)
    @categories2 = Category.where(parrent_id: Category.where(parrent_id: 0).ids).group_by(&:parrent_id)
    @categories3 = Category.where(parrent_id: Category.where(parrent_id: Category.where(parrent_id: 0).ids).ids).group_by(&:parrent_id)
  end

  def new
    @item = Item.new
    @delivary = Delivary.new
    @category = Category.where(parrent_id: 0)
    @category1 = Category.new
  end

  def create
    @item = Item.create(item_params)
    @delivary = Delivary.create(delivary_params)
    if @item.save && @delivary.save
      render 'new-modal'
    else
      @category = Category.where(parrent_id: 0)
      @category1 = Category.new
      render :new
    end
  end

  def show
    if user_signed_in?
      if @item.seller_id === current_user.id
        redirect_to action: 'show_user_item'
      end
    end
  end

  def show_user_item
  end

  def edit
  end

  def update
    @item.images.detach
    @item.update(item_params)
    @delivary = Delivary.find_by(item_id:params[:id])
    @delivary.update(delivary_params)
    redirect_to action: 'show_user_item'
  end

  def destroy
    if @item.seller_id == current_user.id
      if @item.destroy
        redirect_to root_path
      else
        redirect_to action: 'show_user_item'
      end
    else
      redirect_to action: :show
    end
  end

  def search
    @items = Item.with_attached_images.order('created_at DESC').limit(24)
    @item_search = Item.with_attached_images.order('created_at DESC').where('name LIKE(?)', "%#{params[:keyword]}%").limit(24)
    @item_search_count = Item.with_attached_images.where('name LIKE(?)', "%#{params[:keyword]}%").count
    respond_to do |format|
      format.html
      format.json
    end
  end

  def category_search2
    @category2 = Category.where(parrent_id:params[:selected_num])
    respond_to do |format|
      format.json
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :text, :brand_name, :size, :category_id,:status, images: []).merge(params.require(:item).require(:item).permit(:price)).merge(seller_id: current_user.id)
  end

  def delivary_params
    params.require(:item).require(:delivary).permit(:price, :area, :delivary_day, :delivary_method).merge(item_id: @item.id)
  end

  def set_item
    @item = Item.with_attached_images.find(params[:id])
    @user = Item.find(params[:id]).seller
    @delivary = Delivary.find_by(item_id:params[:id])
    @user_item = Item.with_attached_images.where(seller_id: @user.id).order("id DESC").limit(6)
    @categories = Category.where(parrent_id: 0)
    @category1 = Category.find(Category.find(@item.category.parrent_id).parrent_id)
    @category2 = Category.find(@item.category.parrent_id)
    @category3 = @item.category
  end
end
