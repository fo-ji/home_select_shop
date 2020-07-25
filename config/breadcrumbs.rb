crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypage_user_path(current_user)
end

crumb :edit_user do
  link "ユーザー情報編集"
  parent :mypage
end

crumb :creditcard_user do
  link "登録クレジットカード情報"
  parent :mypage
end

crumb :new_creditcard do
  link "登録クレジットカード登録"
  parent :mypage
end

crumb :leave_user do
  link "退会手続き"
  parent :mypage
end

crumb :shop do |shop|
  link "ショップ情報", shop_path(shop)
end

crumb :admin_shop do |shop|
  link "ショップ情報(管理者)", admin_shop_path(shop)
  parent :shop, shop
end

crumb :edit_shop do |shop|
  link "店舗情報変更"
  parent :admin_shop, shop
end

crumb :admin_index_item do |shop|
  link "出品商品一覧", admin_index_shop_path(shop)
  parent :admin_shop, shop
end

crumb :edit_item do |shop|
  link "商品編集"
  parent :admin_index_item, shop
end

crumb :leave_shop do |shop|
  link "ショップ退会手続き"
  parent :admin_shop, shop
end

crumb :new_community do |shop|
  link "コミュニティ登録"
  parent :admin_shop, shop
end

crumb :edit_community do |shop|
  link "コミュニティ編集"
  parent :admin_shop, shop
end

crumb :leave_community do |shop|
  link "コミュニティ削除"
  parent :admin_shop, shop
end

crumb :new_item do |shop|
  link "商品出品"
  parent :admin_shop, shop
end

crumb :cart do
  link "カート"
end

crumb :index_community do
  link "コミュニティ一覧", communities_path
end

crumb :show_community do |community|
  link "#{community.name}のページ", community_path(community)
  parent :index_community, community
end

crumb :community_talk do |community|
  link "トーク"
  parent :show_community, community
end

crumb :community_recommend_index do |community|
  link "レコメンド一覧", community_recommends_path(community)
  parent :show_community, community
end

crumb :community_recommend_new do |community|
  link "レコメンド登録"
  parent :community_recommend_index, community
end
