class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    # redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ""
    
    # if params['payjp-token'].blank?
    #   redirect_to action: "new"
    # else
    customer = Payjp::Customer.create(
    # description: '登録テスト', #なくてもOK
    # email: current_user.email, #なくてもOK
    card: params['payjp-token'],
    # metadata: {user_id: current_user.id}
    ) #念の為metadataにuser_idを入れましたがなくてもOK
    @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
    # binding.pry
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    # end
  end

  def create #Cardのデータpayjpに送り情報を取り出します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ""
      customer = Payjp::Customer.retrieve(card.customer_id)
      
      # binding.pry
      # @default_card_information = customer.cards
      
      
    end
  end
end
