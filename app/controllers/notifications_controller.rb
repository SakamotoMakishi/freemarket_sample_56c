class NotificationsController < ApplicationController

  def index
    @notifications = current_user.passive_notifications.includes(:visiter,:item).limit(10)#未読のお知らせ
    @notifications_true = current_user.passive_notifications.where(checked: true).includes(:visiter,:item).limit(10)#既読のお知らせ
  end

end
