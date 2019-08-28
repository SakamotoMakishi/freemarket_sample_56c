class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      @message.message_notification_by(current_user)
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
