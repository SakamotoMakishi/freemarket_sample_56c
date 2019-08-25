class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :omniauthable
  
  with_options presence: true do
    validates :nickname
    validates :email
    validates :password
    validates :password_confirmation
  end

  has_one_attached :avatar
  has_many :comments
  has_many :items
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> {where("buyer_id is NULL")}, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> {where("buyer_id is not NULL")}, foreign_key: "saler_id", class_name: "Item"
  has_one :address_input
  has_one :card
  has_many :likes, dependent: :destroy
  has_many :like_items, through: :likes, source: :item
  has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
  has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy


  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.new(
        uid:      auth.uid,
        provider: auth.provider,
        nickname: auth.info.name,
        email:    auth.info.email,
        password: Devise.friendly_token[0, 20]
      )
    end
    user
  end
end
