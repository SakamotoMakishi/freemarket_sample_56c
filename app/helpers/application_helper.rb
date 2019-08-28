module ApplicationHelper
  def item_count(user)
    Item.where(seller_id: user.id).count
  end

  def like_count(currnt_user)
    current_user.likes.where(watch: 0).count
  end

  def rating_count(user)
    Item.where(seller_id: user.id).where(rating:[1 ,2 ,3]).count
  end

  def trading_count(user)
    a = current_user.buyed_items.where.not(receipt: true).count
    b = current_user.sold_items.where.not(receipt: true).count
    a+b
  end
end

