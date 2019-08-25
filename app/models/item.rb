class Item < ApplicationRecord
  validate :add_error_message
  validates :price, inclusion: 300..1000000
  belongs_to :user, optional: true
  validate :check_file_presence
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many_attached :images
  has_many :comments,foreign_key: :item_id, dependent: :destroy
  has_one :delivary, foreign_key: :item_id, dependent: :destroy
  belongs_to :category, optional: true

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  has_many :notifications,dependent: :destroy

  def like?(user) 
    likes.where(user_id: user.id).exists?
  end

  def buy_notification_by(current_user)
    notification=current_user.active_notifications.new(
      item_id:self.id,
      visited_id:self.seller.id,
      action:"buy"
    )
    notification.save if notification.valid?
  end

  def create_notification_by(current_user)
    notification=current_user.active_notifications.new(
      item_id:self.id,
      visited_id:self.seller.id,
      action:"like"
    )
    notification.save if notification.valid?
  end

  def delete_notification_by(current_user)
    notification=current_user.active_notifications.find_by(
      item_id:self.id,
      visited_id:self.seller.id,
      action:"like"
    )
    notification.destroy if !notification.nil?
  end

  def check_file_presence
    errors.add(:images, "画像がありません") unless images.attached?
  end

  def add_error_message
    if name.blank? || name.nil?
      errors[:name] << "入力してください"
    end
    if text.blank? || text.nil?
      errors[:text] << "入力してください"
    end
    if status.blank? || status.nil?
      errors[:status] << "選択してください"
    end
    if price.blank? || price.nil?
      errors[:price] << "入力してください"
    end
    if category_id.blank? || category_id.nil?
      errors[:category_id] << "選択してください"
    end
  end
end
