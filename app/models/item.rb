class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional:true
  belongs_to :brand, optional:true
  has_one :delivery

  has_many_attached :images
end
