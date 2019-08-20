class UsersController < ApplicationController
  before_action :set_header

  def show
  end

  def user_card
    gon.payjp_key = ENV["PAYJP_KEY"]
  end
end

  private

  def set_header
    @categories1 = Category.where(parrent_id: 0)
    @categories2 = Category.where(parrent_id: Category.where(parrent_id: 0).ids).group_by(&:parrent_id)
    @categories3 = Category.where(parrent_id: Category.where(parrent_id: Category.where(parrent_id: 0).ids).ids).group_by(&:parrent_id)
  end
end
