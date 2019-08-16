class Item < ApplicationRecord
  validates :name, :text, :status, :price, presence: true
  belongs_to :seller, class_name: "User"
  has_many_attached :images
  has_one :delivary, foreign_key: :item_id, dependent: :destroy
end
