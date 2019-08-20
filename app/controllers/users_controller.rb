class UsersController < ApplicationController
  def show
  end

  def user_card
    gon.payjp_key = ENV["PAYJP_KEY"]
  end
end

