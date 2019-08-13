class AddressInput < ApplicationRecord
  validates :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :prefectures, :city, :address, presence: true
  has_one :user
end
