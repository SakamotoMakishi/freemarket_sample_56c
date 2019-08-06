class Item < ApplicationRecord

  belongs_to :category
  belongs_to :brand
  has_one :delivery
end
