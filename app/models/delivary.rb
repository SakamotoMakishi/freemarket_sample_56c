class Delivary < ApplicationRecord
  has_one :item
  validate :add_error_message

  def add_error_message
    if price.blank? || price.nil?
      errors[:price] << "入力してください"
    end
    if area.blank? || area.nil?
      errors[:area] << "入力してください"
    end
    if delivary_day.blank? || delivary.nil?
      errors[:delivary_day] << "選択してください"
    end
  end
end
