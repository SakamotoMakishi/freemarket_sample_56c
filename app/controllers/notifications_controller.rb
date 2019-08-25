class NotificationsController < ApplicationController
  before_action :set_header

  def index
    @notifications = current_user.passive_notifications.includes(:visiter,:item).limit(20)#未読のお知らせ
    @notifications_true = current_user.passive_notifications.where(checked: true).includes(:visiter,:item).limit(20)#既読のお知らせ
  end

  def set_header
    @categories1 = Category.where(parrent_id: 0)
    @categories2 = Category.where(parrent_id: Category.where(parrent_id: 0).ids).group_by(&:parrent_id)
    @categories3 = Category.where(parrent_id: Category.where(parrent_id: Category.where(parrent_id: 0).ids).ids).group_by(&:parrent_id)
    #@categories1が親
    #@categories2が子
    #@categories3が孫
  end
end
