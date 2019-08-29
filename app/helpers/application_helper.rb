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

  def price_total(user)
    @price_total = current_user.sold_items.where(receipt: true)
    @total_price  = 0
    @price_total.each do |item|
      @total_price += item.price
    end
    return "#{@total_price}円"
  end

  def avatar(user)
    if user.avatar.attached?
      url_for(user.avatar)
    else
      '//static.mercdn.net/images/member_photo_noimage_thumb.png'
    end
  end
end

