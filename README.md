# README

<!-- ![Image from Gyazo](https://gyazo.com/6a8ea91986422ee494d2b0153749c315.jpg) -->

# このアプリについて

 - 制作期間: 2020/6/8 ~
 - 使用Gemや機能は以下に記載

# 制作

<a href="https://github.com/fo-ji"><img src="https://avatars0.githubusercontent.com/u/57491651?s=460&v=4" height="100px;" /></a>

# Gem/ver

* Ruby:2.5.1

* Rails:5.2.4.３

* System dependencies

 <!-- - gem 'mysql2':0.3.18
 - gem 'sass-rails:5.0
 - gem 'jquery-rails'
 - gem 'jbuilder', '~> 2.5'
 - gem 'capistrano'
 - gem 'rspec-rails'
 - gem 'rails-controller-testing'
 - gem 'factory_bot_rails'
 - gem 'pry-rails'
 - gem 'carrierwave'
 - gem 'fog-aws'
 - gem 'unicorn':5.4.1
 - gem 'faker':2.8
 - gem 'mini_magick'
 - gem 'font-awesome-sass'
 - gem 'haml-rails'
 - gem 'owlcarousel-rails'
 - gem 'devise'
 - gem 'active_hash'
 - gem 'ancestry'
 - gem 'omniauth-facebook'
 - gem 'omniauth-google-oauth2'
 - gem "omniauth-rails_csrf_protection"
 - gem 'gretel'
 - gem 'payjp'
 - gem 'ransack' 
 - gem 'kaminari' -->

## サイトURL


## ER図


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

## Credit-cardsテーブル

|Column|Type|Options|
|------|----|-------|
|card_company|string    |null: false|
|card_number |string    |null: false|
|card_year   |integer   |null: false|
|card_month  |integer   |null: false|
|card_pass   |integer   |null: false|
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
|prefecture   |integer   |null: false|
|shipping_date|string    |null: false|

### Association
- belongs_to :shop
- belongs_to :brand
- belongs_to :category
- has_many   :images
- has_many   :messages
- has_many   :likes
- has_many   :cart_items

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
|name|string|null: false|

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

|------|----|-------|
|item_image|string    |null: false|
|item      |references|null: false, foreign_key: true|

### Association
- belongs_to :item
