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
          "あなたが#{item.name}を購入しました!やりとりリストを確認してください。"
        elsif visiter.id == item.buyer_id
          "#{visiter.nickname}が『#{item.name}』を購入しました！購入者に発送しましょう。"
        else
          "エラーです。"
      end
      when "shipping" then
        "#{visiter.nickname}さんが『#{item.name}』を発送をしました！到着までしばらくお待ちください。"
      when "acceptance" then
        "『#{item.name}』の受け取り通知が#{visiter.nickname}さんから届きました！取り引き完了です。お疲れ様でした！"
      when "message" then
        "#{visiter.nickname}さんから取り引きメッセージが届きました！"
    end
  end
end
