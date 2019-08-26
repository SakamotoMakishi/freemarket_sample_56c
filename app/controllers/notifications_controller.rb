class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.includes(:visiter,:item).page(params[:page]).per(24)#未読のお知らせ
    @notifications_true = current_user.passive_notifications.where(checked: true).includes(:visiter,:item).limit(15)#既読のお知らせ
  end
  
  def notifications_none
    notifications=current_user.passive_notifications.includes(:visiter,:item)
    notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    redirect_to notifications_path
  end
end
