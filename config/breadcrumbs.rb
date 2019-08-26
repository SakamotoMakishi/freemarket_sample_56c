crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user)
  parent :root
end

crumb :identification do
  link "本人情報の登録",  edit_address_input_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", signout_users_path
  parent :mypage
end

crumb :card do
  link "支払い方法",  card_add_to_user_path(current_user)
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :mypage
end

crumb :listing do
  link "出品した商品-出品中", listing_user_path
  parent :mypage
end

crumb :trading do
  link "出品した商品-取引中", trading_user_path
  parent :mypage
end

crumb :completed do
  link "出品した商品-売却済み", completed_user_path
  parent :mypage
end

crumb :purchase do
  link "購入した商品-取引中", purchase_user_path
  parent :mypage
end

crumb :purchased do
  link "購入した商品-過去の取引", purchased_user_path
  parent :mypage
end

crumb :notifications do
  link "お知らせ", notifications_path
  parent :mypage
end

crumb :things do
  link "やることリスト", things_user_path
  parent :mypage
end

crumb :likes do
  link "いいね！一覧", likes_path
  parent :mypage
end


crumb :item_message do
  link "取引画面", item_message_user_path
  parent :mypage
end