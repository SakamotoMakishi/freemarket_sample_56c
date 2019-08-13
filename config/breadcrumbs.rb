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

# crumb :card do
#   link "支払い方法", card_cards_path
#   parent :mypage
# end

crumb :profile do
  link "プロフィール", profile_users_path
  parent :mypage
end

# crumb :exhibition do
#   link "出品した商品-出品中", exhibition_users_path
#   parent :mypage
# end

# crumb :trading do
#   link "出品した商品-取引中", trading_users_path
#   parent :mypage
# end

# crumb :sold do
#   link "出品した商品-売却済み", sold_users_path
#   parent :mypage
# end