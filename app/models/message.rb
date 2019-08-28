class Message < ApplicationRecord
  belongs_to :item,optional: true
  belongs_to :user,optional: true
  validates :text, presence: true

  def message_seller_notification_by(current_user)
    notification=current_user.active_notifications.new(
      comment_id:self.id,
      visited_id:self.item.seller.id,
      item_id:self.item.id,
      action:"message"
    )
    notification.save if notification.valid?
  end

  def message_buyer_notification_by(current_user)
    notification=current_user.active_notifications.new(
      comment_id:self.id,
      visited_id:self.item.buyer.id,
      item_id:self.item.id,
      action:"message"
    )
    notification.save if notification.valid?
  end
end
