class Comment < ApplicationRecord
  belongs_to :item,optional: true
  belongs_to :user,optional: true
  validates :text, presence: true
end
