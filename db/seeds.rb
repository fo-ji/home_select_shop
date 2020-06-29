# 親階層
tops             = Category.create(name: "トップス")
jacket_outer     = Category.create(name: "ジャケット/アウター")
pants            = Category.create(name: "パンツ")
all_in_one       = Category.create(name: "オールインワン")
skirt            = Category.create(name: "スカート")
onepeace         = Category.create(name: "ワンピース")
bag              = Category.create(name: "バッグ")
shoes            = Category.create(name: "シューズ")
wallet_accessory = Category.create(name: "財布/小物")
others           = Category.create(name: "その他")

# 子階層_トップス
tops_shirt      = tops.children.create(name: "シャツ")
tops_t_shirt    = tops.children.create(name: "Tシャツ")
tops_polo_shirt = tops.children.create(name: "ポロシャツ")
tops_knit       = tops.children.create(name: "ニット")
tops_parker     = tops.children.create(name: "パーカー")
tops_other      = tops.children.create(name: "その他トップス")

# 子階層_ジャケット/アウター
jo_tailored_jacket = jacket_outer.children.create(name: "テーラードジャケット")
jo_rider_jacket    = jacket_outer.children.create(name: "ライダースジャケット")
jo_blouson         = jacket_outer.children.create(name: "ブルゾン")
jo_ma_1            = jacket_outer.children.create(name: "MA-1")
jo_down_jacket     = jacket_outer.children.create(name: "ダウンジャケット")
jo_coat            = jacket_outer.children.create(name: "コート")
jo_other           = jacket_outer.children.create(name: "その他アウター")

# 子階層_パンツ
p_denim_pants = pants.children.create(name: "デニムパンツ")
p_cargo_pants = pants.children.create(name: "カーゴパンツ")
p_slacks      = pants.children.create(name: "スラックス")
p_other       = pants.children.create(name: "その他パンツ")

# 子階層_オールインワン
aio_over_all = all_in_one.children.create(name: "オーバーオール")
aio_tether   = all_in_one.children.create(name: "つなぎ")

# 子階層_スカート
sk_skirt       = skirt.children.create(name: "スカート")
sk_denim_skirt = skirt.children.create(name: "デニムスカート")

# 子階層_ワンピース
on_onepeace = onepeace.children.create(name: "ワンピース")
on_tunic    = onepeace.children.create(name: "チュニック")

# 子階層_バッグ
bag_shoulder  = bag.children.create(name: "ショルダーバッグ")
bag_backpack  = bag.children.create(name: "リュック/バックパック")
bag_messenger = bag.children.create(name: "メッセンジャーバッグ")
bag_other     = bag.children.create(name: "その他バッグ")

# 子階層_シューズ
shoes_sneakers = shoes.children.create(name: "スニーカー")
shoes_sandals  = shoes.children.create(name: "サンダル")
shoes_boots    = shoes.children.create(name: "ブーツ")
shoes_other    = shoes.children.create(name: "その他シューズ")

# 子階層_財布/小物
wa_wallet    = wallet_accessory.children.create(name: "財布")
wa_pass_case = wallet_accessory.children.create(name: "パスケース")
wa_watch     = wallet_accessory.children.create(name: "腕時計")
wa_other     = wallet_accessory.children.create(name: "その他小物")

# 子階層_財布/小物
ot_other = others.children.create(name: "その他")
