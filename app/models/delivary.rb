class Delivary < ApplicationRecord
  validates :price, :area, :delivary_day, :delivary_method, presence: true
  has_one :item
end