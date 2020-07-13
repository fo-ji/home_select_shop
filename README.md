# README

# HomeSelectShop

 - サイトURL: https://home-select-shop.herokuapp.com/
 - ログインID: 
 - パスワード:

[![Image from Gyazo](https://i.gyazo.com/c4931363e3f5d872b6bdc04709df979a.gif)](https://gyazo.com/c4931363e3f5d872b6bdc04709df979a)

# このアプリについて

**『アパレル小型店舗向けのECサイト』**を制作しました。
個人経営の地方にあるショップをメインのターゲットにしています。

コンセプトは「販売チャンネルの拡大、ファッションに関わらず情報発信の場を提供する」です。

コロナ渦の中、対面販売がメインになっている店舗は特に、大きな打撃を受けたのではないでしょうか。。

個人的な意見ですが、ファッションは売れてるものだけが売れる時代になると少し寂しいです。。
カルチャーの要素が強い地方ショップが少しでも盛り上がれば・・と考えながら制作しました！

### 特徴
 - スタイリストの体型を公開
  * 自分の体型に合ったスタイリストを見つけられます
 [![Image from Gyazo](https://i.gyazo.com/5be66604bf509314ece06ddabab4ed8b.gif)](https://gyazo.com/5be66604bf509314ece06ddabab4ed8b)
 - コミュニティ機能(**未実装**)
  * ファッション以外にもおすすめ音楽や雑貨など、コミュニティ内のトークを通じてショップが独自に情報発信出来きます
  * いいね機能で発信した情報の反応を見れます。(**未実装**)
 - コーディネート商品の出品/購入機能(**未実装**)
  * 5つのアイテムをまとめて出品、まとめて購入できます

### 詳細説明

 - 制作期間: 2020/6/8 ~ 
 - ユーザー管理機能 (**SNS認証は未実装**)
 - 誰でもショップ登録が可能
  * ショップ登録者とスタイリストは商品出品/編集を行うことができる。
 - 商品の購入機能(**現在実装中**)
  * 「カートにいれる」→「カート詳細ページ」→「クレジットカードによる購入」のフローです。
 [![Image from Gyazo](https://i.gyazo.com/167ba58a09d8dc56f36ab32a8521fbc1.gif)](https://gyazo.com/167ba58a09d8dc56f36ab32a8521fbc1)
  * 「今すぐ購入」→「クレジットカードによる購入」も可能です。
 - 商品をまとめて出品/購入(**未実装**)
  * 出品済みのアイテムを(最大5個)まとめて「コーディネート商品」として出品/購入することができます。
 - カテゴリ機能(親、子の2階層)
 [![Image from Gyazo](https://i.gyazo.com/61053274ea782ae01d37c63f8136d3a4.gif)](https://gyazo.com/61053274ea782ae01d37c63f8136d3a4)
 - 画像のプレビュー機能
 [![Image from Gyazo](https://i.gyazo.com/9878685f9afe28f2403716e2cfdd9e38.gif)](https://gyazo.com/9878685f9afe28f2403716e2cfdd9e38)
 - 検索機能(**未実装**)
  * 全商品
  * カテゴリー別
  * ブランド別
  * ショップ別
  * スタイリスト別
 - 商品閲覧ランキング(**未実装**)
  * ユーザーによく閲覧されている人気の商品をランキングで表示します。
 - 注文履歴機能(**未実装**)
  * 過去の取引履歴を確認できます。
 - お気に入り機能(**未実装**)
  * 気になる商品やショップを登録し、すぐにアクセスできるようにします
 - 在庫数管理機能(**未実装**)
  * 出品したアイテムの在庫数を管理できます。

# 制作

<a href="https://github.com/fo-ji"><img src="https://avatars0.githubusercontent.com/u/57491651?s=460&v=4" height="100px;" /></a>

# 環境/Gem(ver)

* Ruby (2.5.1)
* Rails (5.2.4.3)
* Docker
* MySQL (development)
* PostgreSQL (production)
* Heroku
* CircleCI

 - gem 'jquery-rails'
 - gem 'jbuilder', '~> 2.5'
 - gem 'rspec-rails'
 - gem 'rails-controller-testing'
 - gem 'factory_bot_rails'
 - gem 'pry-rails'
 - gem 'carrierwave'
 - gem 'mini_magick'
 - gem 'font-awesome-sass'
 - gem 'haml-rails'
 - gem 'devise'
 - gem 'ancestry'
 - gem 'omniauth-facebook'
 - gem 'omniauth-google-oauth2'
 - gem "omniauth-rails_csrf_protection"
 - gem 'gretel'
 - gem 'payjp'
 - gem 'ransack' 
 - gem 'kaminari'

## ER図
![HomeSelectShop_個人アプリ](https://user-images.githubusercontent.com/57491651/87151558-0aa85e00-c2ef-11ea-9bf3-7803c61043f1.png)

# テーブル
## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname       |string |null: false, unique: true|
|email          |string |null: false, unique: true|
|password       |string |null: false|
|avatar         |text   ||
|introduction   |text   ||
|first_name     |string |null: false|
|last_name      |string |null: false|
|first_name_kana|string |null: false|
|last_name_kana |string |null: false|
|birthday       |date   |null: false|
|height         |integer|null: false|
|body_weight    |integer|null: false|
|foot_size      |integer|null: false|

### Association
- has_one  :addresses
- has_one  :sns_credentials
- has_one  :credit_cards
- has_many :communities_users
- has_many :communities, through: :communities_users
- has_many :talks
- has_many :stylists
- has_many :shops, through: :stylists
- has_many :messages
- has_many :likes
- has_many :item_payments

## Credit_cardsテーブル

|Column|Type|Options|
|------|----|-------|
|customer_id |string    |null: false|
|card_id     |string    |null: false|
|user        |references|null: false, foreign_key: true|

### Association
- belongs_to :user

## Sns_credentialテーブル

|Column|Type|Options|
|------|----|-------|
|provider|string    |null: false|
|uid     |string    |null: false|
|user    |references|null: false, foreign_key: true|

### Association
- belongs_to :user

## Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code |string    |null: false|
|prefecture  |integer   |null: false|
|city        |string    |null: false|
|address     |string    |null: false|
|apartment   |string    ||
|phone_number|integer   |null: false|
|user        |references|null: false, foreign_key: true|

### Association
- belongs_to :user

## Communitiesテーブル

|Column|Type|Options|
|------|----|-------|
|name        |string|null: false, index: true|
|avatar      |text  ||
|introduction|text  ||

### Association
- has_many :communities_users
- has_many :users, through: :communities_users
- has_many :talks

## Communities_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user     |references|null: false, foreign_key: true|
|community|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :community

## Talksテーブル

|Column|Type|Options|
|------|----|-------|
|talk     |text      |null: false, index: true|
|image    |string    ||
|user     |references|null: false, foreign_key: true|
|community|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :community

## Stylistsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|shop|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :shop

## Shopsテーブル

|Column|Type|Options|
|------|----|-------|
|name        |string |null: false|
|postal_code |string |null: false|
|prefecture  |integer|null: false|
|city        |string |null: false|
|address     |string |null: false|
|apartment   |string ||
|phone_number|integer|null: false|
|avatar      |text   ||
|introduction|text   ||
|email       |string |null: false, unique: true|

### Association
- has_many :stylists
- has_many :users, through: :stylists
- has_many :items

## Messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|text      |null: false|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## Likesテーブル

|Column|Type|Options|
|------|----|-------|
|user   |references|null: false, foreign_key: true|
|item   |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|user         |references|null: false, foreign_key: true|
|shop         |references|null: false, foreign_key: true|
|brand        |references|null: false, foreign_key: true|
|category     |references|null: false, foreign_key: true|
|name         |string    |null: false|
|price        |integer   |null: false|
|explain      |text      |null: false|
|size         |string    |null: false|
|postage      |string    |null: false|
|shipping_date|string    |null: false|
|gender       |integer   |null: false|
|stock        |integer   |null: false|

### Association
- belongs_to :shop
- belongs_to :brand
- belongs_to :category
- has_many   :images
- has_many   :messages
- has_many   :likes
- has_many   :cart_items
- has_many   :item_payments

## Cart_itemsテーブル

|Column|Type|Options|
|------|----|-------|
|quantity|integer||
|cart    |references|null: false, foreign_key: true|
|item    |references|null: false, foreign_key: true|

### Association
- belongs_to :cart
- belongs_to :item

## Cartsテーブル

### Association
- has_many :cart_items

## Brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|integer|null: false|

### Association
- has_many :items

## Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name    |string|null: false|
|ancestry|string||

### Association
- has_many :items

## Imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_image|string    |null: false|
|item      |references|null: false, foreign_key: true|

### Association
- belongs_to :item

## Item_paymentsテーブル

|Column|Type|Options|
|------|----|-------|
|purchase_amount|integer   |null: false|
|charge_id      |string    ||
|user           |references|null: false, foreign_key: true|
|item           |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
