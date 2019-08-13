class Item < ApplicationRecord
  validates :name, :text, :status, :price, presence: true
  belongs_to :seller, class_name: "User"
  belongs_to :category, optional:true
  belongs_to :brand, optional:true
  has_one :delivary

  has_many_attached :images
end
