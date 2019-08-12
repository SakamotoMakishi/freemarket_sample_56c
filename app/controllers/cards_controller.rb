class CardsController < ApplicationController
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
  end

  def pay 
    Payjp.api_key = "sk_test_d1d426b6f3691797717ae9a8"
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id)
        if @card.save
          redirect_to action: "show"
        else
          redirect_to action: "new"
        end
  end

  def create 
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = "sk_test_d1d426b6f3691797717ae9a8"
      customer = Payjp::Customer.retrieve(card.customer_id)
    end
  end
end
