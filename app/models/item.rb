class Item < ApplicationRecord
  validate :add_error_message
  belongs_to :user, optional: true
  validate :check_file_presence
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_one :delivary

  has_many_attached :images
  has_one :delivary, foreign_key: :item_id, dependent: :destroy
  belongs_to :category, optional: true

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
