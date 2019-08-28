class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      notification = Item.find_by(id:@message.item_id)
      if current_user.id == notification.seller_id
        @message.message_buyer_notification_by(current_user)#購入者に送る
      elsif current_user.id == notification.buyer_id
        @message.message_seller_notification_by(current_user)#出品者に送る
      end
      respond_to do |format|
        format.html { redirect_to root_path } 
        format.json
      end
    else
      redirect_to root_path
    end
  end
  private
  def message_params
    params.permit(:text, :item_id).merge(user_id: current_user.id)
  end
end
