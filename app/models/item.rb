class Item < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :brand
  belongs_to :category
  has_many   :images,        dependent: :destroy
  has_many   :item_payments, dependent: :destroy
  has_many   :cart_items,    dependent: :destroy

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :brand

  validates :name, :explain, :size, :postage, :shipping_date, :gender, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 9999999}
  validates :stock, presence: true, presence: true, length: { in: 1..3 }, format: { with: /\A[0-9]+\z/ }

  enum size: { "XXS以下": 1, "XS(SS)": 2, "S": 3, "M": 4, "L": 5, "XL(LL)": 6, "2XL(3L)": 7, "3XL(4L)": 8, "4XL(5L)以上": 9, "FREESIZE": 10 }
  enum postage: { "送料無料": 1, "送料500円": 2, "送料1,000円": 3 }
  enum shipping_date: { "1~2日で発送": 1, "2〜3日で発送": 2, "4〜7日で発送": 3 }
  enum gender: { "メンズ": 1, "レディース": 2, "キッズ": 3 }
end
