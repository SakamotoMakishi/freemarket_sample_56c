module ApplicationHelper
  def item_count(user)
    Item.where(seller_id: user.id).count
  end
end
