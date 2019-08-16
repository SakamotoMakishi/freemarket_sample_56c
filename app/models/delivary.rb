class Delivary < ApplicationRecord
  validates :price, :area, :delivary_day, :delivary_method, presence: true
  belongs_to :item
end