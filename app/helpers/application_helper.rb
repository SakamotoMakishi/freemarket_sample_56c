module ApplicationHelper
  def item_count(user)
    user = current_user
    Item.where(seller_id: current_user.id).count
  end
end
