class Delivary < ApplicationRecord

  belongs_to :item,optional: true
  validate :add_error_message

  def add_error_message
    if price.blank? || price.nil?
      errors[:price] << "入力してください"
    end
    if area.blank? || area.nil?
      errors[:area] << "入力してください"
    end
    if delivary_day.blank? || delivary_day.nil?
      errors[:delivary_day] << "選択してください"
    end
    if delivary_method.blank? || delivary_method.nil?
      errors[:delivary_method] << "選択してください"
    end
  end
end

