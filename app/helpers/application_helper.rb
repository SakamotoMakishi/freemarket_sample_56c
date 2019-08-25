module ApplicationHelper
  def item_count(user)
    Item.where(seller_id: user.id).count
  end

  def like_count
    Like.where(watch: 0).count
  end
end
