class Coordinate < ApplicationRecord
  has_many   :coordinate_items
  has_many   :items, through: :coordinate_items
  belongs_to :shop

  validates :name, presence: true, uniqueness: true
  validates :explain, :image, :postage, :shipping_date, :gender, presence: true
  validates :total_price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 100, less_than_or_equal_to: 9999999}
  validates :set, presence: true, length: { in: 1..3 }, format: { with: /\A[0-9]+\z/ }

  mount_uploader :image, ImageUploader

  enum postage: { "送料無料": 1, "送料500円": 2, "送料1,000円": 3 }
  enum shipping_date: { "1~2日で発送": 1, "2〜3日で発送": 2, "4〜7日で発送": 3 }
  enum gender: { "メンズ": 1, "レディース": 2, "キッズ": 3 }
end
