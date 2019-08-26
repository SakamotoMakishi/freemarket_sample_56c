class Comment < ApplicationRecord
  belongs_to :item,optional: true
  belongs_to :user,optional: true
  validates :text, presence: true

  def create_notification_by(current_user)
    notification=current_user.active_notifications.new(
      comment_id:self.id,
      visited_id:self.item.seller.id,
      item_id:self.item.id,
      action:"comment"
    )
    notification.save if notification.valid?
  end
end
