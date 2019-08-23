class Api::ItemsController < ApplicationController

  def new
    respond_to do |format|
      format.json
    end
  end

  def edit
    respond_to do |format|
      format.json{@images = Item.find(params[:id]).images}
    end
  end
  
  def destroy
    Item.find(params[:id]).images[(params[:data]).to_i].purge
    respond_to do |format|
      format.json{@images = Item.find(params[:id]).images}
    end
  end
  
  def update
    Item.find(params[:id]).images.attach(params[:item][:images])
  end

end