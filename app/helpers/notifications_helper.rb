module NotificationsHelper
  def unchecked_notifications
    @notifications=current_user.passive_notifications.where(checked: false)
  end
  def notification_form(notification,current_user)
    @user = current_user
    visiter=notification.visiter
    visited=notification.visited
    item=notification.item
    case notification.action
      when "like" then
        "#{visiter.nickname}さんが『#{item.name}』にいいね！しました！"
      when "comment" then
        if visiter.id == @user.id
          "あなたが『#{item.name}』に返信しました！"
        else
          "#{visiter.nickname}が『#{item.name}』にコメントしました！"
        end
      when "buy" then
        if visiter.id == item.seller_id
          "あなたが#{item.name}を購入しました!発送までしばらくお待ちください!"
        elsif visiter.id == item.buyer_id
          "#{visiter.nickname}が『#{item.name}』を購入しました！発送してください。"
        else
          "エラーです。"
      end
      end
  end
end
