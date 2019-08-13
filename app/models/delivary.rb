class Delivary < ApplicationRecord
  validates :price, :area, :delivary_day, presence: true
  has_one :item
end