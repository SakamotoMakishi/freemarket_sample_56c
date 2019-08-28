class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:root, :index, :show]
  protect_from_forgery
  before_action :set_item, only: [:show, :show_user_item, :edit, :update, :destroy]


  def root
    @women_items = Item.joins(:category).merge(Category.where(parrent_id: Category.where(parrent_id: 1).ids)).with_attached_images.order("id DESC").limit(4)
    @men_items = Item.joins(:category).merge(Category.where(parrent_id: Category.where(parrent_id: 2).ids)).with_attached_images.order("id DESC").limit(4)
    @child_items = Item.joins(:category).merge(Category.where(parrent_id: Category.where(parrent_id: 3).ids)).with_attached_images.order("id DESC").limit(4)
    @chanel_items = Item.with_attached_images.order("RAND()").limit(4)
    @vuitton_items = Item.with_attached_images.order("RAND()").sample(4)
    @nike_items = Item.with_attached_images.order("id DESC").limit(4)
  end

  def index
    @categories33 = Category.where(parrent_id: [4..12])
    @q = Item.with_attached_images.ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @items_count = @q.result.includes(:delivary).count
    @items_search = @q.result.includes(:delivary).page(params[:page]).per(24)
  end

  def new
    @item = Item.new
    @delivary = Delivary.new
    @categories = Category.where(parrent_id: 0)
    @category1 = Category.new
  end

  def create
    @item = Item.create((item_params).merge(images: params[:files]))
    @delivary = Delivary.create(delivary_params)
    if @item.save && @delivary.save
      respond_to do |format|
        format.json
        format.html{render 'new_modal'}
      end
    else
      @categories = Category.where(parrent_id: 0)
      @category1 = Category.new
      render :new
    end
  end

  def new_modal
    @item = Item.last
    @delivary = Delivary.last
  end

  def show
    @comments = @item.comments.includes(:user)
    @rating_good = Item.where(seller_id:Item.find(params[:id]).seller_id).where(rating:1).count
    @rating_nomal = Item.where(seller_id:Item.find(params[:id]).seller_id).where(rating:2).count
    @rating_bad = Item.where(seller_id:Item.find(params[:id]).seller_id).where(rating:3).count
    notifications = current_user.passive_notifications.includes(:visiter,:item).find_by(checked: false)
    unless notifications.nil?
      notifications.update_attributes(checked: true)
    end
    if user_signed_in?
      if @item.seller_id === current_user.id
        redirect_to action: 'show_user_item'
      end
    end
  end

  def show_user_item
    @comments = @item.comments.includes(:user)
    @rating_good = Item.where(seller_id:Item.find(params[:id]).seller_id).where(rating:1).count
    @rating_nomal = Item.where(seller_id:Item.find(params[:id]).seller_id).where(rating:2).count
    @rating_bad = Item.where(seller_id:Item.find(params[:id]).seller_id).where(rating:3).count
  end

  def edit
    if Item.find(params[:id]).seller_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    @delivary = Delivary.find_by(item_id:params[:id])
    @delivary.update(delivary_params)
    flash[:notice] = '商品を編集しました'
    redirect_to action: 'show_user_item'
  end

  def destroy
    if @item.seller_id == current_user.id
      if @item.destroy
        flash[:alert] = '商品を削除しました'
        redirect_to root_path
      else
        redirect_to action: 'show_user_item'
      end
    else
      redirect_to action: :show
    end
  end

  def search
    @item_search = Item.with_attached_images.order('created_at DESC').where('name LIKE(?)',"%#{params[:keyword]}%").limit(24)
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
    params.require(:item).permit(:name, :text, :brand_name, :size, :category_id,:status).merge(params.require(:item).require(:item).permit(:price)).merge(seller_id: current_user.id)
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
